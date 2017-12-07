using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication11
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            List<string> firstNames = new List<string>();
            firstNames.Add("Assalamualaikum");
            firstNames.Add("Namaste");
            firstNames.Add("أهلا وسهلا(Marḥaban)");//arabic
            firstNames.Add("Apa Kabar");//indo
            firstNames.Add("Khamma Ghani");//rajasthani
            firstNames.Add("Mirëdita");// Albanian
            firstNames.Add("Parev");// Armenian
            firstNames.Add("Goddag");//Danish
            firstNames.Add("Goede dag");// Dutch
            firstNames.Add("Guten Tag");//German
            firstNames.Add("Gia'sou");//Greek
            firstNames.Add("Shalom");// Hebrew
            firstNames.Add("Olá");// 
            firstNames.Add("Zdravstvuyte");//Russian
            firstNames.Add("Hola");//Spanish
            firstNames.Add("Selam");//Turkish
            firstNames.Add("আদাব");//বাংলা!

            Random randNum = new Random();
            int aRandomPos = randNum.Next(firstNames.Count);//Returns a nonnegative random number less than the specified maximum (firstNames.Count).

            string currName = firstNames[aRandomPos];

            LabelGreetings.Text = currName.ToString();
            if (LabelGreetings.Text == "Assalamualaikum")
            {
                LabelGreetMeaning.Text = "Now you can greet anyone with great peace!".ToString();
            }
            else if (LabelGreetings.Text == "Namaste")
            {
                LabelGreetMeaning.Text = "Now you can greet anyone by showing respect to their soul!".ToString();
            }
            else if (LabelGreetings.Text == "أهلا وسهلا(Marḥaban)")
            {
                LabelGreetMeaning.Text = "Now you can greet your Arabic friends!".ToString();
            }
            else if (LabelGreetings.Text == "Apa Kabar")
            {
                LabelGreetMeaning.Text = "Now you can greet your Indonesian friends!".ToString();
            }
            else if (LabelGreetings.Text == "Khamma Ghani")
            {
                LabelGreetMeaning.Text = "Now you can greet your Rajasthani friends!".ToString();
            }
            else if (LabelGreetings.Text == "Mirëdita")
            {
                LabelGreetMeaning.Text = "Now you can greet your Albanian friends!".ToString();
            }
            else if (LabelGreetings.Text == "Parev")
            {
                LabelGreetMeaning.Text = "Now you can greet your Armenian friends!".ToString();
            }
            else if (LabelGreetings.Text == "Goddag")
            {
                LabelGreetMeaning.Text = "Now you can greet your Danish friends!".ToString();
            }
            else if (LabelGreetings.Text == "Goede dag")
            {
                LabelGreetMeaning.Text = "Now you can greet your Dutch friends!".ToString();
            }
            else if (LabelGreetings.Text == "Guten Tag")
            {
                LabelGreetMeaning.Text = "Now you can greet your friends in German!".ToString();
            }
            else if (LabelGreetings.Text == "Gia'sou")
            {
                LabelGreetMeaning.Text = "Now you can greet your friends from Greek!".ToString();
            }
            else if (LabelGreetings.Text == "Shalom")
            {
                LabelGreetMeaning.Text = "Now you can greet your friends Hebrew".ToString();
            }
            else if (LabelGreetings.Text == "Olá")
            {
                LabelGreetMeaning.Text = "Now you can greet your Portuguese friends!".ToString();
            }
            else if (LabelGreetings.Text == "Zdravstvuyte")
            {
                LabelGreetMeaning.Text = "Now you can greet your Russian friends!".ToString();
            }
            else if (LabelGreetings.Text == "Hola")
            {
                LabelGreetMeaning.Text = "Now you can greet your Spanish friends!".ToString();
            }
            else if (LabelGreetings.Text == "Selam")
            {
                LabelGreetMeaning.Text = "Now you can greet your Turkish friends!".ToString();
            }
            else if (LabelGreetings.Text == "আদাব")
            {
                LabelGreetMeaning.Text = "Now you can greet in International Mother Language".ToString();
            }
        }
    }
}