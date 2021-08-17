using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Final_window
{
    public partial class frm_datsan : Form
    {
        public frm_datsan()
        {
            InitializeComponent();
        }

        private void Form2_Load(object sender, EventArgs e)
        {
            dateTimePicker1.CustomFormat = "dd-MM-yyyy";
            comboBox1.Items.Add("1");
            comboBox1.Items.Add("2");
            comboBox1.Items.Add("3");
            comboBox1.Text = "1";
        }

        private void numericUpDown3_ValueChanged(object sender, EventArgs e)
        {

        }

        private void label1_Click(object sender, EventArgs e)
        {

        }

        private void dateTimePicker1_ValueChanged(object sender, EventArgs e)
        {

        }

        private void txtHoTen_TextChanged(object sender, EventArgs e)
        {

        }

        private void label6_Click(object sender, EventArgs e)
        {

        }

        private void label4_Click(object sender, EventArgs e)
        {

        }

        private void label3_Click(object sender, EventArgs e)
        {

        }

        private void num_h1_ValueChanged(object sender, EventArgs e)
        {

        }

        private void num_p_ValueChanged(object sender, EventArgs e)
        {

        }

        private void num_h_ValueChanged(object sender, EventArgs e)
        {

        }

        private void txtCMND_TextChanged(object sender, EventArgs e)
        {

        }

        private void label2_Click(object sender, EventArgs e)
        {

        }

        private void txtSDT_TextChanged(object sender, EventArgs e)
        {

        }

        private void label5_Click(object sender, EventArgs e)
        {

        }

        private void label8_Click(object sender, EventArgs e)
        {

        }

        private void comboBox1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
        DBConnector db ;
        private void btn_dat_Click(object sender, EventArgs e)
        {
            db = new DBConnector();
            string cmnd = txtCMND.Text;
            int sosan;
            Int32.TryParse(comboBox1.SelectedItem.ToString(), out sosan);
            DateTime ngaydat = dateTimePicker1.Value;
            string dattu = txt_dattu.Text;
            string dattoi = txt_datden.Text;
            if(db.Find_khachhang(cmnd).Rows.Count!=0)
            {
                db.ThemDatSan(cmnd, sosan, ngaydat, dattu, dattoi);
                this.Hide();
                Form1 frm1 = new Form1();
                frm1.Show();
            }
            else
            {
                string message = "Chưa có thông tin khách hàng. Thêm khách hàng?";
                string title = "Thiếu thông tin";
                MessageBoxButtons buttons = MessageBoxButtons.YesNo;
                DialogResult result = MessageBox.Show(message, title, buttons);
                if (result == DialogResult.Yes)
                {
                    Form6 frm6 = new Form6();
                    frm6.Show();
                }
            }
        }

        private void btn_huy_Click(object sender, EventArgs e)
        {
            this.Hide();
            Form1 frm1 = new Form1();
            frm1.Show();
        }
    }
}
