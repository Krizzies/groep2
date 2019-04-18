using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;

namespace Csharp_kennis
{
    class Program
    {
        static void Main(string[] args)
        {
            string UserName;
            if (args.Length == 2)
            {
                UserName = args[0];
                if (args[1] != PassWord())
                    return;
            }
            else
            {
                //login
                Console.WriteLine("Geef je naam op");
                UserName = Console.ReadLine();
                if (!Login())
                    return;
            }
            Console.WriteLine("Welkom bij Soundsharp " + UserName);

            //voeg mp3 spelers toe
            ArrayList Mp3Spelers = new ArrayList();
            Mp3Spelers.Add(new Product { ID = 1, Make = "GET technologies .inc", Model = "HF 410", MBSize = 4096, Price = 129.95, Stock = 500 });
            Mp3Spelers.Add(new Product { ID = 2, Make = "Far & loud", Model = "XM 600", MBSize = 8192, Price = 224.95, Stock = 500 });
            Mp3Spelers.Add(new Product { ID = 3, Make = "Innovative", Model = "z3", MBSize = 512, Price = 79.95, Stock = 500 });
            Mp3Spelers.Add(new Product { ID = 4, Make = "Resistance S.A.", Model = "3001", MBSize = 4096, Price = 124.95, Stock = 500 });
            Mp3Spelers.Add(new Product { ID = 5, Make = "CBA", Model = "NXT Volume", MBSize = 2048, Price = 159.05, Stock = 500 });

            //show menu
            ConsoleKeyInfo KeyChar;
            int CurrentInput = -1;
            ShowMenu();
            string Statistics = "";
            while (1 == 1)
            {
                KeyChar = Console.ReadKey();
                Console.WriteLine();
                CurrentInput = KeyChar.KeyChar - 48;
                if (CurrentInput == 9)
                    break;
                else if (CurrentInput == 1)
                    foreach (Product X in Mp3Spelers)
                        Console.WriteLine("Mp3 speler " + X.ID + ":\nMerk: " + X.Make + "\nModel: " + X.Model + "\nOpslagcapaciteit: " + X.MBSize + " MB\nPrice: " + X.Price + "\n");
                else if (CurrentInput == 2)
                    foreach (Product X in Mp3Spelers)
                        Console.WriteLine("Mp3 speler " + X.ID + ":\nVoorraad: " + X.Stock + "\n");
                else if (CurrentInput == 3)
                    Mp3Spelers = MutateStock(Mp3Spelers);
                else if (CurrentInput == 4)
                {
                    GetStatistics(Mp3Spelers, out Statistics);
                    Console.WriteLine(Statistics);
                }
                else if (CurrentInput == 5)
                    Mp3Spelers.Add(AddNewMp3Speler(Mp3Spelers));
                else if (CurrentInput == 8)
                    ShowMenu();
                else if (CurrentInput > 0 && CurrentInput < 10)
                    Console.WriteLine("gekozen actie: " + CurrentInput);
            }
        }

        static public string PassWord()
        {
            return "SHARPSOUND";
        }

        static public bool Login()
        {
            int MaximalePogingen = 3;
            Console.WriteLine("Geef je wachtwoord op");
            Console.WriteLine("Poging 1 van 3");
            for (int Pogingen = 2; Pogingen < (MaximalePogingen + 2); Pogingen += 1)
                if (Console.ReadLine() == PassWord())
                    goto Ingelogd;
                else if (Pogingen == 3)
                    Console.WriteLine("LET OP: laatste poging");
                else if (Pogingen < 3)
                    Console.WriteLine("Poging " + Pogingen + " van 3");
            return false;
            Ingelogd:
            return true;
        }

        static void ShowMenu()
        {
            string[] MainMenuPages = new string[9];
            MainMenuPages[0] = "1 Overzicht Mp3 spelers";
            MainMenuPages[1] = "2 Overzicht voorraad Mp3 spelers";
            MainMenuPages[2] = "3 mutatie voorraad";
            MainMenuPages[3] = "4 statestieken";
            MainMenuPages[4] = "5 mp3 speler toevoegen";
            MainMenuPages[7] = "8 menu";
            MainMenuPages[8] = "9 exit";
            Console.Clear();
            for (int index = 0; index < MainMenuPages.Length; index += 1)
                try
                {
                    MainMenuPages[index].Substring(0, 2);
                    Console.WriteLine(MainMenuPages[index]);
                }
                catch { }
        }

        public static ArrayList MutateStock(ArrayList Mp3Spelers)
        {
            Console.WriteLine("Wat is het ID van de mp3 speler?");
            int CurrentID;
            RetryInputID:
            try
            {
                CurrentID = Convert.ToInt32(Console.ReadLine());
                if (CurrentID >= Mp3Spelers.Count)
                {
                    Console.WriteLine("Dit is geen geldig ID");
                    goto RetryInputID;
                }
            }
            catch
            {
                Console.WriteLine("Dit is geen geldig ID");
                goto RetryInputID;
            }
            Console.WriteLine("Hoe groot is de voorrad van mp3 speler " + CurrentID + "?");
            RetryInputStock:
            int CurrentStock;
            try
            {
                CurrentStock = Convert.ToInt32(Console.ReadLine());
            }
            catch
            {
                Console.WriteLine("Dit is geen geldige invoer, de invoer moet een nummer tussen 0 en 2.147.483.647 zijn.");
                goto RetryInputStock;
            }
            var Mp3SpelersArray = Mp3Spelers.ToArray();
            Product CurrentProduct;
            for (int index = 0; index < Mp3SpelersArray.Length; index += 1)
            {
                CurrentProduct = (Product)Mp3SpelersArray[index];
                if (CurrentProduct.ID == CurrentID)
                    CurrentProduct.Stock = CurrentStock;
                Mp3SpelersArray[index] = CurrentProduct;
            }
            ArrayList UpdatedMp3Speler = new ArrayList();
            UpdatedMp3Speler.AddRange(Mp3SpelersArray);
            return UpdatedMp3Speler;
        }

        public static void GetStatistics(ArrayList Mp3Spelers, out string Statistics)
        {
            int TotaleVoorraad = 0;
            double TotaleVoorraadWaarde = 0;
            double PrijsPerMb = 99999999;
            string PrijsPerMbNaam = "";

            foreach (Product X in Mp3Spelers)
            {
                TotaleVoorraad += X.Stock;
                TotaleVoorraadWaarde += X.Stock * X.Price;
                if (PrijsPerMb > (X.Price / X.MBSize))
                {
                    PrijsPerMb = (X.Price / X.MBSize);
                    PrijsPerMbNaam = X.Model;
                }
            }
            Statistics = "Aantal Mp3 spelers in voorraad: " + TotaleVoorraad + "\n";
            Statistics += "Totale waarde van voorraad: " + TotaleVoorraadWaarde + "\n";
            Statistics += "Gemiddelde prijs per mp3speler: " + TotaleVoorraadWaarde / TotaleVoorraad + "\n";
            Statistics += "Mp3 speler met de beste prijs per mB: " + PrijsPerMbNaam + "\n";
        }

        public static Product AddNewMp3Speler(ArrayList Mp3Spelers)
        {
            int ID = Mp3Spelers.ToArray().Length + 1;
            Product ReturnProduct = new Product { ID = ID };
            Console.WriteLine("Merk: ");
            ReturnProduct.Make = Console.ReadLine();
            Console.WriteLine("Model: ");
            ReturnProduct.Model = Console.ReadLine();
            Console.WriteLine("Opslagcapaciteit: ");
            RetryCapacity:
            try
            {
                ReturnProduct.MBSize = Convert.ToDouble(Console.ReadLine());
            }
            catch
            {
                Console.WriteLine("Dit is geen geldige invoer, de invoer moet een nummer tussen 0 en 2.147.483.647 zijn.");
                goto RetryCapacity;
            }
            Console.WriteLine("Prijs: ");
            RetryPrice:
            try
            {
                ReturnProduct.Price = Convert.ToDouble(Console.ReadLine());
            }
            catch
            {
                Console.WriteLine("Dit is geen geldige invoer, de invoer moet een nummer tussen 0 en 2.147.483.647 zijn.");
                goto RetryPrice;
            }
            ReturnProduct.Stock = 0;
            return ReturnProduct;
        }

        public struct Product
        {
            public int ID;
            public string Make;
            public string Model;
            public double MBSize;
            public double Price;
            public int Stock;
        };
    }
}