abstract class BaseViewModel extends BaseViewModelInput with BaseViewModelOutputs{

}

abstract class BaseViewModelInput{
  void start();
  void dispose();

  Sink get inputState;
}

abstract class BaseViewModelOutputs{
  Stream get outputState;
}