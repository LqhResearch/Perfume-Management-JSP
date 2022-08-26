$('.select2').select2({
    theme: 'bootstrap4'
});

$("#table_dt").DataTable({
    "paging": true,
    "lengthChange": true,
    "searching": true,
    "ordering": false,
    "info": true,
    "autoWidth": false,
    "responsive": true,
    "oLanguage": {
        "sSearch": "Tìm kiếm",
        "oPaginate": {
            "sPrevious": "<",
            "sNext": ">"
        },
        "sInfo": "Hiển thị _START_ - _END_ trong _TOTAL_ dòng",
        "sLengthMenu": "Hiển thị _MENU_ dòng",
        "sInfoEmpty": "Hiển thị 0 - 0 trong 0 dòng",
        "sEmptyTable": "Không tìm thấy dữ liệu trên máy chủ"
    }
});

function RemoveRow(id) {
    Swal.fire({
        title: 'Bạn có chắc chắn muốn xoá không?',
        text: "Sau khi xoá xong thì không thể phục hồi được",
        icon: 'error',
        showCancelButton: true,
        confirmButtonColor: '#d33d33',
        confirmButtonText: 'Xoá',
        cancelButtonColor: '#3085d6',
        cancelButtonText: 'Huỷ'
    }).then((result) => {
        if (result.isConfirmed) {
            window.location = window.location + "?del-id=" + id;
        }
    });
}

$('#summernote').summernote();