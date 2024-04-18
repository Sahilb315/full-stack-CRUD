import mongoose from "mongoose";

async function connectDB() {
  try {
    await mongoose.connect(
      "mongodb+srv://Sahil:Sahil315@cluster0.dkxhtbh.mongodb.net/full_stack"
    ).then(()=> {
        console.log("Connected to database");
    });
  } catch (error) {
    console.log("Error connecting to database", error);
  }
}

export { connectDB };
