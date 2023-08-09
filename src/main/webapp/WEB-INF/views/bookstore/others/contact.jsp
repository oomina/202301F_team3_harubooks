<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>

<!--문의 사항 페이지입니다-->
<!-- ====== MAIN CONTENT ===== -->
<main id="content">
	<div class="py-3 py-lg-7">
		<h6 class="font-weight-medium font-size-7 text-center my-1">고객센터</h6>
	</div>

	<div class="container">
		<div class="space-bottom-1 space-bottom-lg-2">
			<div class="pb-4">
				<div class="col-lg-8 mx-auto">
					<div
						class="bg-white mt-n10 mt-md-n13 pt-5 pt-lg-7 px-3 px-md-5 pl-xl-10 pr-xl-3">
						<div class="ml-xl-4">
							<div class="mb-4 mb-lg-7">
								<h6 class="font-weight medium font-size-10 mb-4 mb-lg-7">문의/환불</h6>
								<p class="font-weight-bold ">저희 하루북스를 이용해주셔서 감사드립니다 여러분의
									불편한사항을 신속하게 처리해드리겠습니다.</p>
							</div>
							<div class="mb-4 mb-lg-8">
								<div class="row">
									<div class="col-md-6">
										<h6 class="font-weight-medium font-size-4 mb-4">New York
											Office</h6>
										<address class="font-size-2 mb-5">
											<span class="mb-2 font-weight-normal text-dark"> 1418
												River Drive, Suite 35 Cottonhall, CA 9622 <br> United
												States
											</span>
										</address>
										<div>
											<a href="mailto:sale@bookworm.com"
												class="font-size-2 d-block link-black-100 mb-1">sale@bookworm.com</a>
											<a href="tel:+1246-345-0695"
												class="font-size-2 d-block link-black-100">+1
												246-345-0695</a>
										</div>
									</div>
									<div class="col-md-6">
										<h6 class="font-weight-medium font-size-4 mb-4">London
											Office</h6>
										<address class="font-size-2 mb-5">
											<span class="mb-2 font-weight-normal text-dark"> 1418
												River Drive, Suite 35 Cottonhall, CA 9622 <br> United
												States
											</span>
										</address>
										<div>
											<a href="mailto:sale@bookworm.com"
												class="font-size-2 d-block link-black-100 mb-1">sale@bookworm.com</a>
											<a href="tel:+1246-345-0695"
												class="font-size-2 d-block link-black-100">+1
												246-345-0695</a>
										</div>
									</div>
								</div>
							</div>
							<div class="mb-5 mb-xl-9 pb-xl-1">
								<h6 class="font-size-4 font-weight-medium">Social Media</h6>
								<ul class="list-unstyled mb-0 d-flex">
									<li class="btn pl-0"><a class="link-black-100" href="#">
											<span class="fab fa-instagram"></span>
									</a></li>
									<li class="btn"><a class="link-black-100" href="#"> <span
											class="fab fa-facebook-f"></span>
									</a></li>
									<li class="btn"><a class="link-black-100" href="#"> <span
											class="fab fa-youtube"></span>
									</a></li>
									<li class="btn"><a class="link-black-100" href="#"> <span
											class="fab fa-twitter"></span>
									</a></li>
									<li class="btn"><a class="link-black-100" href="#"> <span
											class="fab fa-pinterest"></span>
									</a></li>
								</ul>
							</div>
							<div>
								<h6 class="font-weight-bold font-size-7 mb-3 pb-xl-1">개인 정보
									입력</h6>
								<form class="js-validate" novalidate="novalidate">
									<div class="row">
										<!-- Input -->
										<div class="col-sm-6 mb-5">
											<div class="js-form-message">
												<label for="exampleFormControlInput1">이름</label> <input
													id="exampleFormControlInput1" type="text"
													class="form-control rounded-0" name="name"
													aria-label="Jack Wayley" required=""
													data-error-class="u-has-error"
													data-msg="Please enter your name."
													data-success-class="u-has-success">
											</div>
										</div>
										<!-- End Input -->

										<!-- Input -->
										<div class="col-sm-6 mb-5">
											<div class="js-form-message">
												<label for="exampleFormControlInput2">이메일</label> <input
													id="exampleFormControlInput2" type="email"
													class="form-control rounded-0" name="email"
													aria-label="jackwayley@gmail.com" required=""
													data-msg="Please enter a valid email address."
													data-error-class="u-has-error"
													data-success-class="u-has-success">
											</div>
										</div>
										<!-- End Input -->
										<div class="col-sm-12 mb-5">
											<div class="js-form-message">
												<label for="exampleFormControlInput3">문의 종류</label><br>
												<div
													class="custom-control custom-radio custom-control-inline">
													<input type="radio" id="customRadioInline1"
														name="customRadioInline1" class="custom-control-input"
														value="일반"> <label class="custom-control-label"
														for="customRadioInline1">일반 문의</label>
												</div>
												<div
													class="custom-control custom-radio custom-control-inline">
													<input type="radio" id="customRadioInline2"
														name="customRadioInline1" class="custom-control-input"
														value="환불"> <label class="custom-control-label"
														for="customRadioInline2">환불 문의</label>
												</div>
											</div>
										</div>
										<div class="col-sm-12 mb-5">
											<div class="js-form-message">
												<div class="input-group flex-column">
													<label for="exampleFormControlInput4">여러분들의 소중한 의견을
														자세하게 적어주세요</label>
													<textarea id="exampleFormControlInput4"
														class="form-control rounded-0 pl-3 font-size-2 placeholder-color-3"
														rows="6" cols="77" name="text"
														placeholder="여러분의 소중한 의견을 경청하는 하루북스가 되겠습니다"
														aria-label="Hi there, I would like to ..." required=""
														data-msg="Please enter a reason."
														data-error-class="u-has-error"
														data-success-class="u-has-success"></textarea>
												</div>
												<label
													class="btn btn-sm btn-primary transition-3d-hover file-attachment-btn"
													for="fileAttachmentBtn"> 사진을 첨부해주세요 <input
													id="fileAttachmentBtn" name="file-attachment" type="file"
													class="file-attachment-btn__label">
												</label>
											</div>
										</div>
										<!-- End Input -->
										<div class="col d-flex justify-content-lg-start">
											<button type="submit"
												class="checkout-button button alt wc-forward btn p-3 mb-2 bg-success text-white btn-block rounded-0 py-4">제출하기</button>
										</div>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</main>
<!-- ====== END MAIN CONTENT ===== -->

