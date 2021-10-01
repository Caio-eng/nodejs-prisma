import express, {Request, Response} from "express";
import { PrismaClient } from ".prisma/client";

const app = express();
app.use(express.json());

const prisma = new PrismaClient();

app.post("/createCar", async (req: Request, res: Response) => {
    const { nome, marca, modelo, ano } = req.body;
    const car = await prisma.car.create({
        data: {
            nome: nome,
            marca: marca,
            modelo: modelo,
            ano: ano
        },
    });
    res.json(car);
});

app.post("/createManyCars", async (req: Request, res: Response) => {
    const { carList } = req.body;
    const cars = await prisma.car.createMany({
        data: carList,
    });
    res.json(cars);
});

app.get("/findCars", async (req: Request, res: Response) => {
    const cars = await prisma.car.findMany({});
    res.json(cars);
});

app.get("/findCar/:id", async (req: Request, res: Response) => {
    const id = req.params.id;
    const cars = await prisma.car.findUnique({
        where: {
            id: Number(id),
        },
    });
    res.json(cars);
});

app.put("/updateCar/:id", async (req: Request, res: Response) => {
    const id = req.params.id;
    const { nome, marca, modelo, ano } = req.body
    const updateCar = await prisma.car.update({
        where: {
            id: Number(id)
        },
        data: {
            nome: nome,
            marca: marca,
            modelo: modelo,
            ano: ano
        }
    });
    res.json(updateCar);
});
 
app.delete("/deleteCar/:id", async (req: Request, res: Response) => {
    const id = req.params.id
    const deletedCar = await prisma.car.delete({
        where: {
            id: Number(id),
        }
    });
    res.json(deletedCar);
 });

app.listen(5000, () => {
    console.log('Rodando na porta 5000')
});