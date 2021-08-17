using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Data.SqlClient;

namespace Final_window
{
    public partial class frm_thongtin : Form
    {

        public frm_thongtin()
        {
            InitializeComponent();
        }

        private void txtHoTen_TextChanged(object sender, EventArgs e)
        {
        }

        private void button2_Click(object sender, EventArgs e)
        {

        }

        private void button3_Click(object sender, EventArgs e)
        {
            string cmnd = txtCMND.Text;
            int sosan;
            Int32.TryParse(comboBox1.SelectedItem.ToString(), out sosan);
            DateTime ngaydat = dateTimePicker1.Value;
            string dattu = txtDatTu.Text;
            string dattoi = txtDatDen.Text;
            SqlCommand cmd = new SqlCommand("sp_delete_datsan", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@cmnd", SqlDbType.VarChar).Value = cmnd;
            cmd.Parameters.Add("@sanso", SqlDbType.Int).Value = sosan;
            cmd.Parameters.Add("@ngaydat", SqlDbType.Date).Value = ngaydat;
            cmd.Parameters.Add("@dattu", SqlDbType.VarChar).Value = dattu;
            cmd.Parameters.Add("@datoi", SqlDbType.VarChar).Value = dattoi;
            cmd.ExecuteNonQuery();
            db = new DBConnector();
            dataGridView1.DataSource = db.get_all_ThongTin();
            dataGridView1.Refresh();
        }

        private void timer1_Tick(object sender, EventArgs e)
        {
        }
        SqlConnection con;
        private void button1_Click(object sender, EventArgs e)
        {
            string cmnd = txtCMND.Text;
            int sosan;
            Int32.TryParse(comboBox1.SelectedItem.ToString(), out sosan);
            DateTime ngaydat = dateTimePicker1.Value;
            string dattu = txtDatTu.Text;
            string dattoi = txtDatDen.Text;
            TimeSpan time = DateTime.Now.TimeOfDay;
            SqlCommand cmd = new SqlCommand("sp_update_tgbatdau", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@cmndKhach", SqlDbType.VarChar).Value = cmnd;
            cmd.Parameters.Add("@sosan", SqlDbType.Int).Value = sosan;
            cmd.Parameters.Add("@ngaydat", SqlDbType.Date).Value = ngaydat;
            cmd.Parameters.Add("@dattu", SqlDbType.VarChar).Value = dattu;
            cmd.Parameters.Add("@dattoi", SqlDbType.VarChar).Value = dattoi;
            cmd.Parameters.Add("@tgbd", SqlDbType.Time).Value = time;
            cmd.ExecuteNonQuery();
            db = new DBConnector();
            dataGridView1.DataSource = db.get_all_ThongTin();
            dataGridView1.Refresh();
        }
        DBConnector db;
        private void frm_thongtin_Load(object sender, EventArgs e)
        {
            dateTimePicker1.CustomFormat = "dd-MM-yyyy";
            txt_timtheoten.Focus();
            db = new DBConnector();
            dataGridView1.DataSource = db.get_all_ThongTin();
            dataGridView1.Refresh();
            for (int i = 5; i < dataGridView1.Columns.Count; i++)
                dataGridView1.Columns[i].Visible = false;
            comboBox1.Items.Add("1");
            comboBox1.Items.Add("2");
            comboBox1.Items.Add("3");
            comboBox1.Text = "1";
            string str = "Data Source=DESKTOP-AN9GNNF\\SQLEXPRESS;Initial Catalog=ql_sancaulong;Persist Security Info=True;User ID=sa;Password=Tinh2014";
            con = new SqlConnection(str);
            con.Open();
        }

        private void button2_Click_1(object sender, EventArgs e)
        {
            db = new DBConnector();
            string cmnd = txtCMND.Text;
            int sosan;
            Int32.TryParse(comboBox1.SelectedItem.ToString(), out sosan);
            DateTime ngaydat = dateTimePicker1.Value;
            string dattu = txtDatTu.Text;
            string dattoi = txtDatDen.Text;
            TimeSpan time = DateTime.Now.TimeOfDay;
            SqlCommand cmd = new SqlCommand("sp_thanhtoan", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@cmndKhach", SqlDbType.VarChar).Value = cmnd;
            cmd.Parameters.Add("@sosan", SqlDbType.Int).Value = sosan;
            cmd.Parameters.Add("@ngaydat", SqlDbType.Date).Value = ngaydat;
            cmd.Parameters.Add("@dattu", SqlDbType.VarChar).Value = dattu;
            cmd.Parameters.Add("@dattoi", SqlDbType.VarChar).Value = dattoi;
            cmd.Parameters.Add("@tgkt", SqlDbType.Time).Value = time;
            TimeSpan time1;
            TimeSpan.TryParse(dataGridView1.SelectedRows[0].Cells[2].Value.ToString(), out time1);
            cmd.Parameters.Add("@tongtien",SqlDbType.Float).Value = (time.Subtract(time1).TotalMinutes*1000).ToString();
            cmd.ExecuteNonQuery();
            dataGridView1.DataSource = db.get_all_ThongTin();
            dataGridView1.Refresh();
            
        }

        private void button4_Click(object sender, EventArgs e)
        {

        }

        private void button5_Click(object sender, EventArgs e)
        {
            if (txt_timtheoten.Text == "")
            {
                dataGridView1.DataSource = db.get_all_ThongTin();
                dataGridView1.Refresh();
            }
            else
            {
                dataGridView1.DataSource = db.getDataTheoTen(txt_timtheoten.Text);
                dataGridView1.Refresh();
            }

        }
        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            int RowIndex = e.RowIndex;
            if (e.RowIndex >= 0)
            {
                DataGridViewRow row = dataGridView1.Rows[e.RowIndex];
                txtCMND.Text = row.Cells["cmnd"].Value.ToString();
                txtHoTen.Text = row.Cells["Họ và tên"].Value.ToString();
                txtSDT.Text = row.Cells["sdt"].Value.ToString();
                dateTimePicker1.Text = row.Cells["ngaydat"].Value.ToString();
                comboBox1.Text = row.Cells["Số sân"].Value.ToString();
                txtDatTu.Text = row.Cells["dattu"].Value.ToString();
                txtDatDen.Text = row.Cells["dattoi"].Value.ToString();
            }
        }

        private void textBox2_TextChanged(object sender, EventArgs e)
        {

        }

        private void btnTimTheoSDT_Click(object sender, EventArgs e)
        {
            if (txtTimTheoSDT.Text == "")
            {
                dataGridView1.DataSource = db.get_all_ThongTin();
                dataGridView1.Refresh();
            }
            else
            {
                dataGridView1.DataSource = db.getDataTheoSDT(txtTimTheoSDT.Text);
                dataGridView1.Refresh();
            }
        }

        private void button5_Click_1(object sender, EventArgs e)
        {
            DataTable dt = db.getHOADONS();
            string mahd = dt.Rows.Count.ToString();
            string hoten, sanso, ngaydat, tgstart, tgend, thanhtien;
            hoten = dataGridView1.SelectedRows[0].Cells[0].Value.ToString();
            sanso = comboBox1.SelectedItem.ToString();
            ngaydat = dateTimePicker1.Value.ToString("dd/MM/yyyy");
            tgstart = dataGridView1.SelectedRows[0].Cells[2].Value.ToString();
            tgend = dataGridView1.SelectedRows[0].Cells[3].Value.ToString();
            thanhtien = dataGridView1.SelectedRows[0].Cells[10].Value.ToString();
            if (thanhtien == null || thanhtien == "0")
            {
                MessageBox.Show("Hóa đơn chưa được thanh toán! Vui lòng thanh toán trước khi xuất hóa đơn."); ;
            }
            else
            {
                SqlCommand cmd = new SqlCommand("insert into HOADONDATSAN values(@mahd,@hovanten, @sanso, @ngaydat, @tgbatdau, @tgketthuc, @thanhtien)", con);
                cmd.Parameters.AddWithValue("mahd", mahd);
                cmd.Parameters.AddWithValue("hovanten", hoten);
                cmd.Parameters.AddWithValue("sanso", sanso);
                cmd.Parameters.AddWithValue("ngaydat", ngaydat);
                cmd.Parameters.AddWithValue("tgbatdau", tgstart);
                cmd.Parameters.AddWithValue("tgketthuc", tgend);
                cmd.Parameters.AddWithValue("thanhtien", thanhtien);
                cmd.ExecuteNonQuery();
                string message = "Mã hóa đơn của bạn là: " + mahd;
                string title = "Thanh toán hoàn thành";
                MessageBoxButtons buttons = MessageBoxButtons.YesNo;
                DialogResult result = MessageBox.Show(message, title, buttons);
                if (result == DialogResult.Yes)
                {
                    Form4 frm4 = new Form4();
                    frm4.Show();
                }
            }   
        }

        private void groupBox3_Enter(object sender, EventArgs e)
        {

        }

        private void dateTimePicker1_ValueChanged(object sender, EventArgs e)
        {

        }
    }
}
