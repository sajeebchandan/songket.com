using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OOSDDemo
{
    public partial class Standard_Calculator : System.Web.UI.Page
    {
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
    }
}