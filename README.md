# Shoppers Stop - E-commerce Application

A full-stack e-commerce application built with Play Framework (Scala) and React.

## Features

- User Authentication (Local + OAuth2 with Google/Facebook)
- Product Management
- Shopping Cart
- Wishlists
- Category Management

## Technologies Used

### Backend
- Play Framework 2.8
- Scala 2.13
- Silhouette (Authentication)
- Slick (ORM)
- SQLite

### Frontend
- React 17
- React Router
- React Bootstrap
- React Hook Form
- Bootstrap 5

## Prerequisites

- JDK 8 or higher
- sbt 1.5.4 or higher
- Node.js 16 or higher
- npm or yarn
- SQLite

## Project Structure
├── app/ # Backend Scala code
├── conf/ # Backend configuration
├── front/ # React frontend
└── db/ # SQLite database

## Local Development Setup

### Backend

bash
Create SQLite database directory
mkdir -p db
Start the Play Framework server

sbt run # Start development server
sbt test # Run tests
sbt clean # Clean build files
sbt compile # Compile project

The backend will run on http://localhost:9000


### Frontend
bash
cd front
npm install
npm start # Start development server
npm test # Run tests
npm run build # Build for production

The frontend will run on http://localhost:3000

## Available API Endpoints

### Authentication
- POST /api/signUp - Register new user
- POST /api/signIn - Login user
- GET /api/signOut - Logout user
- GET /api/authenticate/:provider - OAuth2 authentication

### Products
- GET /api/product - List all products
- POST /api/product - Create product
- PUT /api/product/:id - Update product
- DELETE /api/product/:id - Delete product

### Cart
- GET /api/cartitem - Get user's cart
- POST /api/cartitem - Add item to cart
- PUT /api/cartitem/:id - Update cart item
- DELETE /api/cartitem/:id - Remove from cart

### Wishlist
- GET /api/wishlist - Get user's wishlists
- POST /api/wishlist - Create wishlist
- PUT /api/wishlist/:id - Update wishlist
- DELETE /api/wishlist/:id - Delete wishlist

## Database Schema

The application uses SQLite with the following main tables:
- user - User accounts
- product - Product catalog
- category - Product categories
- cartitem - Shopping cart items
- wishlist - User wishlists
- oAuth2Info - OAuth2 authentication data
- passwordInfo - Local authentication data

## Contributing

1. Fork the repository
2. Create your feature branch (git checkout -b feature/AmazingFeature)
3. Commit your changes (git commit -m 'Add some AmazingFeature')
4. Push to the branch (git push origin feature/AmazingFeature)
5. Open a Pull Request