import { createContext, useEffect, useReducer } from "react";
import Cookie from 'js-cookie';
import sendRequest from "./utils";

const CHECK_ENDPOINT = process.env.REACT_APP_API_URL + '/check';

const defaultState = {
  email: "",
  name: "",
  city:"",
  address:""
}

const reducer = (state, action) => {
  switch (action.type) {

    case 'set-user': {
      console.log('setting user' + JSON.stringify(action.payload))
      const { name, email, city, address } = action.payload;
      return {
        email: email,
        name: name,
        city: city || "",
        address: address || "",
      }
    }

    case 'clear-user': {
      return {...defaultState}
    }

    default:
      throw new Error('Unknown action type: ' + action.type);
  }
}

// ===========================

const userContext = createContext(defaultState);
const { Provider } = userContext;

const UserProvider = ({ children }) => {
  const [state, dispatch] = useReducer(reducer, defaultState);

  useEffect(() => {
    const email = Cookie.get('profile');
    const name = Cookie.get('username')
    const city = Cookie.get('city')
    const address = Cookie.get('address')
    if (!email || !name) {
      return;
    }
    Cookie.remove('profile')
    Cookie.remove('username', { path: '/', domain: 'localhost' })
    Cookie.remove('city', { path: '/', domain: 'localhost' })
    Cookie.remove('address', { path: '/', domain: 'localhost' })

    dispatch({
      type: 'set-user', payload: {
        email: email,
        name: name,
        city: decodeURIComponent(city || ""),
        address: decodeURIComponent(address || "")
      }
    });
  }, []);

  useEffect(() => {
    sendRequest(CHECK_ENDPOINT)
      .then(data => {
        console.log(data)
        if (data.email !== 'Guest') {
          dispatch({ type: 'set-user', payload: data })
        }
      })
  }, []);

  return <Provider value={{ state, dispatch }}>{children}</Provider>
}

export { userContext, UserProvider }