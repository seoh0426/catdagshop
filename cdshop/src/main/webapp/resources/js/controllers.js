function addToCart(action){
	document.addForm.action = action;
	document.addForm.submit();
	alert("상품이 장바구니에 추가되었습니다!")
}

function deleteConfirm(id){
	if (confirm("삭제합니다!") == true) location.href="./delete?id="+id;
	else return;
}