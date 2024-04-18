import mongoose from "mongoose";

async function connectDB() {
  try {
    await mongoose.connect(process.env.MONGO_DB_URI).then(()=> {
        console.log("Connected to database");
    });
  } catch (error) {
    console.log("Error connecting to database", error);
  }
}

export { connectDB };
