using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OOSDDemo
{
    public partial class Scientific_Calculator : System.Web.UI.Page
    {
        double num1 = 0;
        double num2 = 0;
        double num3 = 0;
        double result = 0;
        bool isOpPerformed = false;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LabelMessage.Visible = false;
                TextBox1.Text = "0";
                ViewState["num1"] = 0;
                ViewState["num2"] = 0;
                ViewState["num3"] = 0;
                ViewState["mem"] = 0;
                ViewState["mem_store"] = 0;
            }
        }
        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("Scientific Calculator.aspx");
        }

        protected void Button0_Click(object sender, EventArgs e)
        {
            if (TextBox1.Text.Equals("0") || (isOpPerformed))

                TextBox1.Text = string.Empty;
            isOpPerformed = false;
            TextBox1.Text = TextBox1.Text + Button0.Text;
            LabelMessage.Visible = false;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (TextBox1.Text.Equals("0") || (isOpPerformed))

                TextBox1.Text = string.Empty;
            isOpPerformed = false;
            TextBox1.Text = TextBox1.Text + Button1.Text;
            LabelMessage.Visible = false;
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            if (TextBox1.Text.Equals("0") || (isOpPerformed))

                TextBox1.Text = string.Empty;
            isOpPerformed = false;
            TextBox1.Text = TextBox1.Text + Button2.Text;
            LabelMessage.Visible = false;
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            if (TextBox1.Text.Equals("0") || (isOpPerformed))

                TextBox1.Text = string.Empty;
            isOpPerformed = false;
            TextBox1.Text = TextBox1.Text + Button3.Text;
            LabelMessage.Visible = false;
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            if (TextBox1.Text.Equals("0") || (isOpPerformed))

                TextBox1.Text = string.Empty;
            isOpPerformed = false;
            TextBox1.Text = TextBox1.Text + Button4.Text;
            LabelMessage.Visible = false;
        }

        protected void Button5_Click(object sender, EventArgs e)
        {
            if (TextBox1.Text.Equals("0") || (isOpPerformed))

                TextBox1.Text = string.Empty;
            isOpPerformed = false;
            TextBox1.Text = TextBox1.Text + Button5.Text;
            LabelMessage.Visible = false;
        }

        protected void Button6_Click(object sender, EventArgs e)
        {
            if (TextBox1.Text.Equals("0") || (isOpPerformed))

                TextBox1.Text = string.Empty;
            isOpPerformed = false;
            TextBox1.Text = TextBox1.Text + Button6.Text;
            LabelMessage.Visible = false;
        }

        protected void Button7_Click(object sender, EventArgs e)
        {
            if (TextBox1.Text.Equals("0") || (isOpPerformed))

                TextBox1.Text = string.Empty;
            isOpPerformed = false;
            TextBox1.Text = TextBox1.Text + Button7.Text;
            LabelMessage.Visible = false;
        }

        protected void Button8_Click(object sender, EventArgs e)
        {
            if (TextBox1.Text.Equals("0") || (isOpPerformed))

                TextBox1.Text = string.Empty;
            isOpPerformed = false;
            TextBox1.Text = TextBox1.Text + Button8.Text;
            LabelMessage.Visible = false;
        }

        protected void Button9_Click(object sender, EventArgs e)
        {
            if (TextBox1.Text.Equals("0") || (isOpPerformed))

                TextBox1.Text = string.Empty;
            isOpPerformed = false;
            TextBox1.Text = TextBox1.Text + Button9.Text;
            LabelMessage.Visible = false;
        }

        protected void ButtonBack_Click(object sender, EventArgs e)
        {
            try
            {
                LabelMessage.Visible = false;
                TextBox1.Text = TextBox1.Text.Remove(TextBox1.Text.Length - 1, 1);
            }
            catch (Exception)
            {
                LabelMessage.Visible = true;
                LabelMessage.Text = "Display is EMPTY!".ToString();
                LabelMessage.ForeColor = System.Drawing.Color.Red;
            }
        }

        protected void ButtonClearentry_Click(object sender, EventArgs e)
        {
            LabelMessage.Visible = false;
            TextBox1.Text = "0";
        }

        protected void ButtonClear_Click(object sender, EventArgs e)
        {
            TextBox1.Text = string.Empty;
            TextBox1.Text = "0";
            TextBoxLabel.Text = string.Empty;
            ViewState["num1"] = 0;
            ViewState["num2"] = 0;
            ViewState["num3"] = 0;
            ViewState["mem"] = 0;
            ViewState["mem_store"] = 0;
            LabelMessage.Visible = false;
        }

        protected void ButtonSS_Click(object sender, EventArgs e)
        {
            try
            {
                LabelMessage.Visible = false;
                TextBox1.Text = Convert.ToString((Convert.ToDouble(TextBox1.Text) * -1));
            }
            catch (Exception ex)
            {
                LabelMessage.Visible = true;
                LabelMessage.Text = (ex.Message);
            }
        }

        protected void ButtonRoot_Click(object sender, EventArgs e)
        {
            try
            {
                LabelMessage.Visible = false;
                TextBoxLabel.Text = ButtonRoot.Text + TextBox1.Text;
                TextBox1.Text = Convert.ToString(Math.Sqrt(Convert.ToDouble(TextBox1.Text)));
                TextBox1.Focus();
            }
            catch (Exception ex)
            {
                LabelMessage.Visible = true;
                LabelMessage.Text = (ex.Message);
            }
        }

        protected void ButtonMclear_Click(object sender, EventArgs e)
        {
            try
            {
                LabelMessage.Visible = false;
                TextBox1.Text = string.Empty;
                ViewState["mem"] = null;
                TextBoxLabel.Text = ("Memory Cleared!");
                TextBox1.Focus();
            }
            catch (Exception ex)
            {
                LabelMessage.Visible = true;
                LabelMessage.Text = (ex.Message);
            }
        }

        protected void ButtonMresult_Click(object sender, EventArgs e)
        {
            try
            {
                LabelMessage.Visible = false;
                if (Convert.ToDouble(ViewState["mem_store"].ToString()) != 0)
                {
                    TextBoxLabel.Text = "Memory Result::";
                    TextBox1.Text = "Memory Store Result=" + Convert.ToString(ViewState["mem_store"]);
                    TextBox1.Focus();

                }
                if (Convert.ToDouble(ViewState["mem"].ToString()) != 0)
                {
                    TextBoxLabel.Text = "Memory Result::";
                    TextBox1.Text = TextBox1.Text + "\nMemory +/- Result=" + Convert.ToString(ViewState["mem"]);
                    TextBox1.Focus();
                }
            }
            catch (Exception ex)
            {
                LabelMessage.Visible = true;
                LabelMessage.Text = (ex.Message);
            }
        }

        protected void ButtonMstore_Click(object sender, EventArgs e)
        {
            try
            {
                LabelMessage.Visible = false;
                ViewState["mem_store"] = Convert.ToDouble(TextBox1.Text);
                TextBoxLabel.Text = ("Memory Stored!");
                TextBox1.Text = string.Empty;
                TextBox1.Focus();
            }
            catch (Exception ex)
            {
                LabelMessage.Visible = true;
                LabelMessage.Text = (ex.Message);
            }
        }

        protected void ButtonMminus_Click(object sender, EventArgs e)
        {
            try
            {
                LabelMessage.Visible = false;
                ViewState["mem"] = Convert.ToDouble(ViewState["mem"].ToString()) - Convert.ToDouble(TextBox1.Text);
                TextBoxLabel.Text = ("Memory Substracted!");
                TextBox1.Text = string.Empty;
                TextBox1.Focus();
            }
            catch (Exception ex)
            {
                LabelMessage.Visible = true;
                LabelMessage.Text = (ex.Message);
            }
        }

        protected void ButtonMplus_Click(object sender, EventArgs e)
        {
            try
            {
                LabelMessage.Visible = false;

                ViewState["mem"] = Convert.ToDouble(ViewState["mem"].ToString()) + Convert.ToDouble(TextBox1.Text);
                TextBoxLabel.Text = ("Memory Added!");
                TextBox1.Text = string.Empty;
                TextBox1.Focus();
            }
            catch (Exception ex)
            {
                LabelMessage.Visible = true;
                LabelMessage.Text = (ex.Message);
            }
        }
        protected void ButtonSum_Click(object sender, EventArgs e)
        {
            try
            {
                LabelMessage.Visible = false;
                //if (ViewState["op"].ToString() == "")
                //{
                //    TextBoxLabel.Text = string.Empty;
                //}
                if (Convert.ToInt32(ViewState["num1"].ToString()) == 0)
                {
                    ViewState["num1"] = 0;
                    //double num1= Convert.ToDouble(ViewState["num1"].ToString());
                    ViewState["op"] = "+";
                    ViewState["num1"] = Convert.ToDouble(TextBox1.Text);
                    isOpPerformed = true;

                    TextBoxLabel.Text = TextBoxLabel.Text + TextBox1.Text + ButtonSum.Text;
                    TextBox1.Text = string.Empty;
                    TextBox1.Focus();
                }

                else if (Convert.ToDouble(ViewState["num1"].ToString()) != 0)
                {
                    TextBoxLabel.Text = TextBoxLabel.Text + TextBox1.Text + ButtonSum.Text;
                    PerformClick();
                    isOpPerformed = true;
                    ViewState["op"] = "+";
                    //TextBoxLabel.Text = TextBoxLabel.Text + TextBox1.Text + ButtonSum.Text;
                    TextBox1.Text = string.Empty;
                    TextBox1.Focus();
                }

                //else
                //{
                //    ViewState["op"] = "+";
                //    ViewState["num1"] = Convert.ToDouble(TextBox1.Text);
                //    isOpPerformed = true;

                //    TextBoxLabel.Text = TextBoxLabel.Text + TextBox1.Text + ButtonSum.Text;
                //    TextBox1.Text = string.Empty;
                //}

            }
            catch (Exception ex)
            {
                LabelMessage.Visible = true;
                LabelMessage.Text = (ex.Message);
                TextBoxLabel.Text = TextBoxLabel.Text + TextBox1.Text;
            }
        }

        protected void ButtonEqual_Click(object sender, EventArgs e)
        {
            try
            {
                LabelMessage.Visible = false;
                TextBoxLabel.Text = TextBoxLabel.Text + TextBox1.Text;
                PerformClick();
                TextBoxLabel.Text = TextBoxLabel.Text + "=";
                TextBox1.Focus();

            }
            catch (Exception ex)
            {
                LabelMessage.Visible = true;
                LabelMessage.Text = (ex.Message);
            }
            isOpPerformed = false;
        }

        protected void ButtonSub_Click(object sender, EventArgs e)
        {
            try
            {
                LabelMessage.Visible = false;
                if (Convert.ToInt32(ViewState["num1"].ToString()) == 0)
                {
                    ViewState["num1"] = 0;
                    //double num1= Convert.ToDouble(ViewState["num1"].ToString());
                    ViewState["op"] = "-";
                    ViewState["num1"] = Convert.ToDouble(TextBox1.Text);
                    isOpPerformed = true;

                    TextBoxLabel.Text = TextBoxLabel.Text + TextBox1.Text + ButtonSub.Text;
                    TextBox1.Text = string.Empty;
                    TextBox1.Focus();
                }

                else if (Convert.ToDouble(ViewState["num1"].ToString()) != 0)
                {
                    TextBoxLabel.Text = TextBoxLabel.Text + TextBox1.Text + ButtonSub.Text;
                    PerformClick();
                    isOpPerformed = true;
                    ViewState["op"] = "-";
                    //TextBoxLabel.Text = TextBoxLabel.Text + TextBox1.Text + ButtonSum.Text;
                    TextBox1.Text = string.Empty;
                    TextBox1.Focus();
                }

                //else
                //{
                //    ViewState["op"] = "+";
                //    ViewState["num1"] = Convert.ToDouble(TextBox1.Text);
                //    isOpPerformed = true;

                //    TextBoxLabel.Text = TextBoxLabel.Text + TextBox1.Text + ButtonSum.Text;
                //    TextBox1.Text = string.Empty;
                //}

            }
            catch (Exception ex)
            {
                LabelMessage.Visible = true;
                LabelMessage.Text = (ex.Message);
                TextBoxLabel.Text = TextBoxLabel.Text + TextBox1.Text;
            }
        }

        protected void ButtonMul_Click(object sender, EventArgs e)
        {
            try
            {
                LabelMessage.Visible = false;
                //if (ViewState["op"].ToString() == "")
                //{
                //    TextBoxLabel.Text = string.Empty;
                //}
                if (Convert.ToDouble(ViewState["num1"].ToString()) == 0)
                {
                    ViewState["num1"] = 0;
                    //double num1= Convert.ToDouble(ViewState["num1"].ToString());
                    ViewState["op"] = "*";
                    ViewState["num1"] = Convert.ToDouble(TextBox1.Text);
                    isOpPerformed = true;

                    TextBoxLabel.Text = TextBoxLabel.Text + TextBox1.Text + ButtonMul.Text;
                    TextBox1.Text = string.Empty;
                    TextBox1.Focus();
                }

                else if (Convert.ToDouble(ViewState["num1"].ToString()) != 0)
                {
                    TextBoxLabel.Text = TextBoxLabel.Text + TextBox1.Text + ButtonMul.Text;
                    PerformClick();
                    isOpPerformed = true;
                    ViewState["op"] = "*";
                    //TextBoxLabel.Text = TextBoxLabel.Text + TextBox1.Text + ButtonSum.Text;
                    TextBox1.Text = string.Empty;
                    TextBox1.Focus();
                }

                //else
                //{
                //    ViewState["op"] = "+";
                //    ViewState["num1"] = Convert.ToDouble(TextBox1.Text);
                //    isOpPerformed = true;

                //    TextBoxLabel.Text = TextBoxLabel.Text + TextBox1.Text + ButtonSum.Text;
                //    TextBox1.Text = string.Empty;
                //}

            }
            catch (Exception ex)
            {
                LabelMessage.Visible = true;
                LabelMessage.Text = (ex.Message);
                TextBoxLabel.Text = TextBoxLabel.Text + TextBox1.Text;
            }
        }

        protected void ButtonDiv_Click(object sender, EventArgs e)
        {

            try
            {
                LabelMessage.Visible = false;
                //if (ViewState["op"].ToString() == "")
                //{
                //    TextBoxLabel.Text = string.Empty;
                //}
                if (Convert.ToDouble(ViewState["num1"].ToString()) == 0)
                {
                    ViewState["num1"] = 0;
                    //double num1= Convert.ToDouble(ViewState["num1"].ToString());
                    ViewState["op"] = "/";
                    ViewState["num1"] = Convert.ToDouble(TextBox1.Text);
                    isOpPerformed = true;

                    TextBoxLabel.Text = TextBoxLabel.Text + TextBox1.Text + ButtonDiv.Text;
                    TextBox1.Text = string.Empty;
                    TextBox1.Focus();
                }

                else if (Convert.ToDouble(ViewState["num1"].ToString()) != 0)
                {
                    TextBoxLabel.Text = TextBoxLabel.Text + TextBox1.Text + ButtonDiv.Text;
                    PerformClick();
                    isOpPerformed = true;
                    ViewState["op"] = "/";
                    //TextBoxLabel.Text = TextBoxLabel.Text + TextBox1.Text + ButtonSum.Text;
                    TextBox1.Text = string.Empty;
                    TextBox1.Focus();
                }

                //else
                //{
                //    ViewState["op"] = "+";
                //    ViewState["num1"] = Convert.ToDouble(TextBox1.Text);
                //    isOpPerformed = true;

                //    TextBoxLabel.Text = TextBoxLabel.Text + TextBox1.Text + ButtonSum.Text;
                //    TextBox1.Text = string.Empty;
                //}

            }
            catch (Exception ex)
            {
                LabelMessage.Visible = true;
                LabelMessage.Text = (ex.Message);
                TextBoxLabel.Text = TextBoxLabel.Text + TextBox1.Text;
            }
            //try
            //{
            //    PerformClick();
            //    TextBoxLabel.Text = TextBoxLabel.Text + TextBox1.Text + ButtonDiv.Text;

            //    isOpPerformed = true;
            //    ViewState["op"] = "/";
            //    //TextBoxLabel.Text = TextBoxLabel.Text + TextBox1.Text + ButtonSum.Text;
            //    TextBox1.Text = string.Empty;
            //    TextBox1.Focus();

            //    //else
            //    //{
            //    //    ViewState["op"] = "+";
            //    //    ViewState["num1"] = Convert.ToDouble(TextBox1.Text);
            //    //    isOpPerformed = true;

            //    //    TextBoxLabel.Text = TextBoxLabel.Text + TextBox1.Text + ButtonSum.Text;
            //    //    TextBox1.Text = string.Empty;
            //    //}

            //}
            //catch (Exception ex)
            //{

            //    LabelMessage.Text = (ex.Message);
            //    TextBoxLabel.Text = TextBoxLabel.Text + TextBox1.Text;
            //}
        }

        private void PerformClick()
        {
            string op = ViewState["op"].ToString();
            switch (op)
            {

                case "+":
                    TextBox1.Text = (Convert.ToDouble(ViewState["num1"]) + Convert.ToDouble(TextBox1.Text)).ToString();
                    //TextBoxLabel.Text = TextBoxLabel.Text + TextBox1.Text;
                    break;

                case "-":
                    TextBox1.Text = (Convert.ToDouble(ViewState["num1"]) - Convert.ToDouble(TextBox1.Text)).ToString();
                    break;

                case "*":
                    TextBox1.Text = (Convert.ToDouble(ViewState["num1"]) * Convert.ToDouble(TextBox1.Text)).ToString();
                    break;

                case "/":
                    TextBox1.Text = (Convert.ToDouble(ViewState["num1"]) / Convert.ToDouble(TextBox1.Text)).ToString();
                    if (TextBox1.Text.Equals("NaN") || TextBox1.Text.Equals("Infinity"))
                    {
                        //playaudio();
                    }

                    break;
                case "Exp":

                    result = num3 * (Math.Pow(10, Convert.ToDouble(TextBox1.Text)));
                    TextBox1.Text = Convert.ToString(result);
                    break;
                case "Mod":
                    num2 = Convert.ToDouble(TextBox1.Text);
                    TextBoxLabel.Text = TextBoxLabel.Text + num2;
                    result = num3 % num2;
                    TextBox1.Text = Convert.ToString(result);
                    break;

                case "Rootn":
                    num2 = Convert.ToDouble(TextBox1.Text);
                    result = Math.Pow(num3, 1 / num2);
                    TextBox1.Text = Convert.ToString(result);
                    break;

                case "^":
                    num2 = Convert.ToDouble(TextBox1.Text);
                    TextBoxLabel.Text = TextBoxLabel.Text + num2;
                    result = Math.Pow(num3, num2);
                    TextBox1.Text = Convert.ToString(result);
                    break;

                default:
                    break;
            }
            ViewState["num1"] = Convert.ToDouble(TextBox1.Text);
            ViewState["op"] = "";

        }


        protected void ButtonInverse_Click(object sender, EventArgs e)
        {
            try
            {
                LabelMessage.Visible = false;
                TextBoxLabel.Text = "1/" + TextBox1.Text;
                TextBox1.Text = Convert.ToString((1 / Convert.ToDouble(TextBox1.Text)));
                TextBox1.Focus();
            }
            catch (Exception ex)
            {
                LabelMessage.Visible = true;
                TextBoxLabel.Text = ex.Message;
                TextBoxLabel.ForeColor = System.Drawing.Color.Red;
            }
        }

        protected void ButtonReload_Click(object sender, EventArgs e)
        {
            Response.Redirect("Calculator.aspx");
        }

        protected void ButtonDot_Click(object sender, EventArgs e)
        {
            try
            {
                LabelMessage.Visible = false;
                if (TextBox1.Text.Equals("0") || (isOpPerformed))

                    TextBox1.Text = "0";

                if (TextBox1.Text.Contains("."))
                {
                    LabelMessage.Text = "There is already a dot(.)";
                }
                else
                {
                    isOpPerformed = false;
                    TextBox1.Text = TextBox1.Text + ButtonDot.Text;
                }
            }
            catch (Exception ex)
            {
                LabelMessage.Visible = true;
                LabelMessage.Text = ex.Message;
                LabelMessage.ForeColor = System.Drawing.Color.Red;
            }
        }

        protected void ButtonParcent_Click(object sender, EventArgs e)
        {
            try
            {
                LabelMessage.Visible = false;
                TextBoxLabel.Text = TextBoxLabel.Text + TextBox1.Text + ButtonParcent.Text;
                ViewState["num2"] = Convert.ToDouble(TextBox1.Text);
                ViewState["result"] = Convert.ToDouble(ViewState["num1"].ToString()) * (Convert.ToDouble(ViewState["num2"].ToString()) / 100);
                TextBox1.Text = Convert.ToString(ViewState["result"]);

            }
            catch (Exception ex)
            {
                LabelMessage.Visible = true;
                LabelMessage.Text = ex.Message;
            }
        }

        protected void ButtonBin_Click(object sender, EventArgs e)
        {
            try
            {
                TextBoxLabel.Text = "Bin" + "(" + TextBox1.Text + ")";
                string num = (TextBox1.Text);
                string binary = Convert.ToString(Convert.ToInt32(num, fromBase: 10), toBase: 2);
                TextBox1.Text = binary;
            }
            catch (Exception ex)
            {
                TextBoxLabel.Text = ex.Message;
                TextBoxLabel.ForeColor = System.Drawing.Color.Red;
            }
        }

        protected void Button1ln_Click(object sender, EventArgs e)
        {
            try
            {
                TextBox1.Text = Convert.ToString(Math.Log(Convert.ToDouble(TextBox1.Text), Math.E));
            }
            catch (Exception ex)
            {
                LabelMessage.Visible = true;
                LabelMessage.Text = ex.Message;
                LabelMessage.ForeColor = System.Drawing.Color.Red;
            }
        }

        protected void ButtonHex_Click(object sender, EventArgs e)
        {
            try
            {
                TextBoxLabel.Text = "Hex" + "(" + TextBox1.Text + ")";
                string num = (TextBox1.Text);
                string hexa = Convert.ToString(Convert.ToInt32(num, fromBase: 10), toBase: 16);
                TextBox1.Text = hexa.ToString().ToUpper();
            }
            catch (Exception ex)
            {
                LabelMessage.Visible = true;
                LabelMessage.Text = ex.Message;
                LabelMessage.ForeColor = System.Drawing.Color.Red;
            }
        }

        protected void ButtonOct_Click(object sender, EventArgs e)
        {
            try
            {
                TextBoxLabel.Text = "Oct" + "(" + TextBox1.Text + ")";
                string num = (TextBox1.Text);
                string octal = Convert.ToString(Convert.ToInt32(num, fromBase: 10), toBase: 8);
                TextBox1.Text = octal;
            }
            catch (Exception ex)
            {
                LabelMessage.Visible = true;
                LabelMessage.Text = ex.Message;
                LabelMessage.ForeColor = System.Drawing.Color.Red;
            }
        }

        protected void ButtonInt_Click(object sender, EventArgs e)
        {
            try
            {
                TextBox1.Text = Convert.ToDouble(TextBox1.Text).ToString("#");
            }
            catch (Exception ex)
            {
                LabelMessage.Visible = true;
                LabelMessage.Text = ex.Message;
                LabelMessage.ForeColor = System.Drawing.Color.Red;
            }
        }

        protected void ButtonSquare_Click(object sender, EventArgs e)
        {
            try
            {
                TextBoxLabel.Text = "sqr" + "(" + TextBox1.Text + ")";
                TextBox1.Text = Convert.ToString(Convert.ToDouble(TextBox1.Text) * Convert.ToDouble(TextBox1.Text));
            }
            catch (Exception ex)
            {
                LabelMessage.Visible = true;
                LabelMessage.Text = ex.Message;
                LabelMessage.ForeColor = System.Drawing.Color.Red;
            }
        }

        protected void ButtonFactorial_Click(object sender, EventArgs e)
        {
            try
            {
                num1 = Convert.ToDouble(TextBox1.Text);
                double dac = 1;
                int count;
                if (num1 < 0)
                {
                    //playaudio();
                    TextBox1.Text = ("Error! Factorial of negetive number does not exist!");
                }
                else
                {
                    for (count = 1; count <= num1; ++count)
                    {
                        dac *= count;
                        TextBox1.Text = Convert.ToString(dac);
                    }
                }
            }
            catch (Exception ex)
            {
                LabelMessage.Visible = true;
                LabelMessage.Text = ex.Message;
                LabelMessage.ForeColor = System.Drawing.Color.Red;
            }
        }

        protected void ButtonPi_Click(object sender, EventArgs e)
        {
            TextBox1.Text = Convert.ToString(Math.PI);
        }

        protected void ButtonPowern_Click(object sender, EventArgs e)
        {
            try
            {
                TextBoxLabel.Text = TextBox1.Text + "^";
                ViewState["num3"] = Convert.ToDouble(TextBox1.Text);
                TextBox1.Text = null;
                ViewState["op"] = "^";
            }
            catch (Exception ex)
            {
                LabelMessage.Visible = true;
                LabelMessage.Text = ex.Message;
                LabelMessage.ForeColor = System.Drawing.Color.Red;
            }
        }

        protected void ButtonRootn_Click(object sender, EventArgs e)
        {
            try
            {
                ViewState["num3"] = Convert.ToDouble(TextBox1.Text);
                TextBoxLabel.Text = ViewState["num3"] + " nroot";
                TextBox1.Text = null;
                ViewState["op"] = "Rootn";
            }
            catch (Exception ex)
            {
                LabelMessage.Visible = true;
                LabelMessage.Text = ex.Message;
                LabelMessage.ForeColor = System.Drawing.Color.Red;
            }
        }

        protected void ButtonSquarecube_Click(object sender, EventArgs e)
        {
            try
            {
                TextBoxLabel.Text = "cube" + "(" + TextBox1.Text + ")";
                TextBox1.Text = Convert.ToString(Convert.ToDouble(TextBox1.Text) * Convert.ToDouble(TextBox1.Text) * Convert.ToDouble(TextBox1.Text));
            }
            catch (Exception ex)
            {
                LabelMessage.Visible = true;
                LabelMessage.Text = ex.Message;
                LabelMessage.ForeColor = System.Drawing.Color.Red;
            }
        }

        protected void ButtonCubicroot_Click(object sender, EventArgs e)
        {
            try
            {
                TextBoxLabel.Text = "cubicroot(" + TextBox1.Text + ") =";
                TextBox1.Text = Convert.ToString(Math.Pow(Convert.ToDouble(TextBox1.Text), (1.0 / 3.0)));
            }
            catch (Exception ex)
            {
                LabelMessage.Visible = true;
                LabelMessage.Text = ex.Message;
                LabelMessage.ForeColor = System.Drawing.Color.Red;
            }
        }

        protected void ButtonFe_Click(object sender, EventArgs e)
        {
            try
            {
                TextBox1.Text = Convert.ToDouble(TextBox1.Text).ToString("0.##########################################################e+0");
            }
            catch (Exception ex)
            {
                LabelMessage.Visible = true;
                LabelMessage.Text = ex.Message;
                LabelMessage.ForeColor = System.Drawing.Color.Red;
            }
        }

        protected void ButtonExp_Click(object sender, EventArgs e)
        {
            try
            {
                TextBox1.Text = Convert.ToDouble(TextBox1.Text).ToString("0.'.'e+#'0'");
            }
            catch (Exception ex)
            {
                LabelMessage.Visible = true;
                LabelMessage.Text = ex.Message;
                LabelMessage.ForeColor = System.Drawing.Color.Red;
            }
        }

        protected void ButtonMod_Click(object sender, EventArgs e)
        {
            try
            {
                TextBoxLabel.Text = TextBox1.Text + " Mod ";
                num3 = Convert.ToDouble(TextBox1.Text);
                TextBox1.Text = null;
                ViewState["op"] = "Mod";
            }
            catch (Exception ex)
            {
                LabelMessage.Visible = true;
                LabelMessage.Text = ex.Message;
                LabelMessage.ForeColor = System.Drawing.Color.Red;
            }
        }

        protected void ButtonLog_Click(object sender, EventArgs e)
        {
            try
            {
                TextBoxLabel.Text = "log" + "(" + TextBox1.Text + ")";
                TextBox1.Text = Convert.ToString(Math.Log10(Convert.ToDouble(TextBox1.Text)));
            }
            catch (Exception ex)
            {
                LabelMessage.Visible = true;
                LabelMessage.Text = ex.Message;
                LabelMessage.ForeColor = System.Drawing.Color.Red;
            }
        }

        protected void ButtonPowerten_Click(object sender, EventArgs e)
        {
            try
            {
                TextBoxLabel.Text = "powten" + "(" + TextBox1.Text + ")";
                TextBox1.Text = Convert.ToString(Math.Pow(10, Convert.ToDouble(TextBox1.Text)));
            }
            catch (Exception ex)
            {

                LabelMessage.Visible = true;
                LabelMessage.Text = ex.Message;
                LabelMessage.ForeColor = System.Drawing.Color.Red;
            }
        }

        protected void ButtonExit_Click(object sender, EventArgs e)
        {
            Response.Redirect("Home.aspx");
        }

        //protected void Button2_Click(object sender, EventArgs e)
        //{
        //    if (TextBox1.Text.Equals("0") || (isOpPerformed))

        //        TextBox1.Text = string.Empty;
        //    isOpPerformed = false;
        //    TextBox1.Text = TextBox1.Text + Button2.Text;
        //}

        //protected void Button1_Click(object sender, EventArgs e)
        //{
        //    if (TextBox1.Text.Equals("0") || (isOpPerformed))

        //        TextBox1.Text = string.Empty;
        //    isOpPerformed = false;
        //    TextBox1.Text = TextBox1.Text + Button1.Text;
        //}

        protected void ButtonSinh_Click(object sender, EventArgs e)
        {
            try
            {
                if (RadioButtonDegrees.Checked)
                {
                    TextBoxLabel.Text = "sinh" + "(" + TextBox1.Text + ")";
                    TextBox1.Text = Convert.ToString(Math.Sinh(Convert.ToDouble(TextBox1.Text)));
                }
                else if (RadioButtonRadians.Checked)
                {
                    TextBoxLabel.Text = "sinh" + "(" + TextBox1.Text + ")";
                    TextBox1.Text = Convert.ToString(Math.Sinh(Convert.ToDouble(TextBox1.Text)));
                }
                else if (RadioButtonGrads.Checked)
                {
                    TextBoxLabel.Text = "sinh" + "(" + TextBox1.Text + ")";
                    TextBox1.Text = Convert.ToString(Math.Sinh(Convert.ToDouble(TextBox1.Text)));
                }
            }
            catch (Exception ex)
            {
                LabelMessage.Visible = true;
                LabelMessage.Text = ex.Message;
                LabelMessage.ForeColor = System.Drawing.Color.Red;
            }
        }

        protected void ButtongSin_Click(object sender, EventArgs e)
        {
            try
            {
                if (RadioButtonDegrees.Checked)
                {
                    TextBoxLabel.Text = "sinD" + "(" + TextBox1.Text + ")";
                    TextBox1.Text = Convert.ToString(Math.Sin(Convert.ToDouble(TextBox1.Text) * Math.PI / 180));
                }
                else if (RadioButtonRadians.Checked)
                {
                    TextBoxLabel.Text = "sinR" + "(" + TextBox1.Text + ")";
                    TextBox1.Text = Convert.ToString(Math.Sin(Convert.ToDouble(TextBox1.Text)));
                }
                else if (RadioButtonGrads.Checked)
                {
                    TextBoxLabel.Text = "sinG" + "(" + TextBox1.Text + ")";
                    TextBox1.Text = Convert.ToString(Math.Sin(Convert.ToDouble(TextBox1.Text) * Math.PI / 200.0));
                }
            }
            catch (Exception ex)
            {
                LabelMessage.Visible = true;
                LabelMessage.Text = ex.Message;
                LabelMessage.ForeColor = System.Drawing.Color.Red;
            }
        }

        protected void ButtonSininv_Click(object sender, EventArgs e)
        {
            try
            {
                num1 = Convert.ToDouble(TextBox1.Text);
                if (RadioButtonDegrees.Checked)
                {
                    TextBoxLabel.Text = "asinD" + "(" + TextBox1.Text + ")";
                    TextBox1.Text = Convert.ToString(Math.Asin(num1) * 180 / Math.PI);
                }
                else if (RadioButtonRadians.Checked)
                {
                    TextBoxLabel.Text = "asinR" + "(" + TextBox1.Text + ")";
                    TextBox1.Text = Convert.ToString(Math.Asin(num1));
                }
                else if (RadioButtonGrads.Checked)
                {
                    TextBoxLabel.Text = "asinG" + "(" + TextBox1.Text + ")";
                    TextBox1.Text = Convert.ToString(Math.Asin(num1) * 200.0 / Math.PI);
                }
            }
            catch (Exception ex)
            {

                LabelMessage.Visible = true;
                LabelMessage.Text = ex.Message;
                LabelMessage.ForeColor = System.Drawing.Color.Red;
            }
        }

        protected void ButtonCos_Click(object sender, EventArgs e)
        {
            try
            {
                if (RadioButtonDegrees.Checked)
                {
                    TextBoxLabel.Text = "cosD" + "(" + TextBox1.Text + ")";
                    TextBox1.Text = Convert.ToString(Math.Cos(Convert.ToDouble(TextBox1.Text) * Math.PI / 180));
                }
                else if (RadioButtonRadians.Checked)
                {
                    TextBoxLabel.Text = "cosR" + "(" + TextBox1.Text + ")";
                    TextBox1.Text = Convert.ToString(Math.Cos(Convert.ToDouble(TextBox1.Text)));
                }
                else if (RadioButtonGrads.Checked)
                {
                    TextBoxLabel.Text = "cosG" + "(" + TextBox1.Text + ")";
                    TextBox1.Text = Convert.ToString(Math.Cos(Convert.ToDouble(TextBox1.Text) * Math.PI / 200));
                }
            }
            catch (Exception ex)
            {

                LabelMessage.Visible = true;
                LabelMessage.Text = ex.Message;
                LabelMessage.ForeColor = System.Drawing.Color.Red;
            }
        }

        protected void ButtonCosinv_Click(object sender, EventArgs e)
        {
            try
            {
                if (RadioButtonDegrees.Checked)
                {
                    TextBoxLabel.Text = "acosD" + "(" + TextBox1.Text + ")";
                    TextBox1.Text = Convert.ToString(Math.Acos(Convert.ToDouble(TextBox1.Text)) * Math.PI / 180);
                }
                else if (RadioButtonRadians.Checked)
                {
                    TextBoxLabel.Text = "acosR" + "(" + TextBox1.Text + ")";
                    TextBox1.Text = Convert.ToString(Math.Acos(Convert.ToDouble(TextBox1.Text)));
                }
                else if (RadioButtonGrads.Checked)
                {
                    TextBoxLabel.Text = "acosG" + "(" + TextBox1.Text + ")";
                    TextBox1.Text = Convert.ToString(Math.Acos(Convert.ToDouble(TextBox1.Text)) * Math.PI / 200);
                }
            }
            catch (Exception ex)
            {

                LabelMessage.Visible = true;
                LabelMessage.Text = ex.Message;
                LabelMessage.ForeColor = System.Drawing.Color.Red;
            }
        }

        protected void ButtonSinhinv_Click(object sender, EventArgs e)
        {
            try
            {
                num1 = Convert.ToDouble(TextBox1.Text);
                TextBoxLabel.Text = "asinh" + "(" + TextBox1.Text + ")";
                TextBox1.Text = Convert.ToString(Math.Log(num1 + Math.Sqrt(num1 * num1 + 1)));
            }
            catch (Exception ex)
            {

                LabelMessage.Visible = true;
                LabelMessage.Text = ex.Message;
                LabelMessage.ForeColor = System.Drawing.Color.Red;
            }
        }

        protected void ButtonTan_Click(object sender, EventArgs e)
        {
            try
            {
                if (RadioButtonDegrees.Checked)
                {
                    TextBoxLabel.Text = "tanD" + "(" + TextBox1.Text + ")";
                    TextBox1.Text = Convert.ToString(Math.Tan(Convert.ToDouble(TextBox1.Text) * Math.PI / 180));
                }
                else if (RadioButtonRadians.Checked)
                {
                    TextBoxLabel.Text = "tanR" + "(" + TextBox1.Text + ")";
                    TextBox1.Text = Convert.ToString(Math.Tan(Convert.ToDouble(TextBox1.Text)));
                }
                else if (RadioButtonGrads.Checked)
                {
                    TextBoxLabel.Text = "tanG" + "(" + TextBox1.Text + ")";
                    TextBox1.Text = Convert.ToString(Math.Tan(Convert.ToDouble(TextBox1.Text) * Math.PI / 200));
                }
            }
            catch (Exception ex)
            {

                LabelMessage.Visible = true;
                LabelMessage.Text = ex.Message;
                LabelMessage.ForeColor = System.Drawing.Color.Red;
            }
        }

        protected void ButtonTaninv_Click(object sender, EventArgs e)
        {
            try
            {
                if (RadioButtonDegrees.Checked)
                {
                    TextBoxLabel.Text = "atanD" + "(" + TextBox1.Text + ")";
                    TextBox1.Text = Convert.ToString(Math.Atan(Convert.ToDouble(TextBox1.Text)) * Math.PI / 180);
                }
                else if (RadioButtonRadians.Checked)
                {
                    TextBoxLabel.Text = "atanR" + "(" + TextBox1.Text + ")";
                    TextBox1.Text = Convert.ToString(Math.Atan(Convert.ToDouble(TextBox1.Text)));
                }
                else if (RadioButtonGrads.Checked)
                {
                    TextBoxLabel.Text = "atanG" + "(" + TextBox1.Text + ")";
                    TextBox1.Text = Convert.ToString(Math.Atan(Convert.ToDouble(TextBox1.Text)) * Math.PI / 200);
                }
            }
            catch (Exception ex)
            {

                LabelMessage.Visible = true;
                LabelMessage.Text = ex.Message;
                LabelMessage.ForeColor = System.Drawing.Color.Red;
            }
        }

        protected void ButtonCosh_Click(object sender, EventArgs e)
        {
            try
            {
                TextBoxLabel.Text = "cosh" + "(" + TextBox1.Text + ")";
                TextBox1.Text = Convert.ToString(Math.Cosh(Convert.ToDouble(TextBox1.Text)));
            }
            catch (Exception ex)
            {

                LabelMessage.Visible = true;
                LabelMessage.Text = ex.Message;
                LabelMessage.ForeColor = System.Drawing.Color.Red;
            }
        }

        protected void ButtonCoshinv_Click(object sender, EventArgs e)
        {
            num1 = Convert.ToDouble(TextBox1.Text);
            TextBoxLabel.Text = "acosh" + "(" + TextBox1.Text + ")";
            TextBox1.Text = Convert.ToString(Math.Log(num1 + Math.Sqrt(num1 * num1 - 1)));
        }

        protected void ButtonTanh_Click(object sender, EventArgs e)
        {
            try
            {
                TextBoxLabel.Text = "tanh" + "(" + TextBox1.Text + ")";
                TextBox1.Text = Convert.ToString(Math.Tanh(Convert.ToDouble(TextBox1.Text)));
            }
            catch (Exception ex)
            {

                LabelMessage.Visible = true;
                LabelMessage.Text = ex.Message;
                LabelMessage.ForeColor = System.Drawing.Color.Red;
            }
        }

        protected void ButtonTanhinv_Click(object sender, EventArgs e)
        {
            try
            {
                num1 = Convert.ToDouble(TextBox1.Text);
                TextBoxLabel.Text = "atanh" + "(" + TextBox1.Text + ")";
                TextBox1.Text = Convert.ToString(Math.Log((1 + num1) / (1 - num1)) / 2);
            }
            catch (Exception ex)
            {
                LabelMessage.Visible = true;
                LabelMessage.Text = ex.Message;
                LabelMessage.ForeColor = System.Drawing.Color.Red;
            }
        }
    }
}