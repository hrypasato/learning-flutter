abstract class BaseViewModel extends BaseViewModelInputs
    with BaseViewModelOutputs {
  //shared variables and functions that will be used through any view model
}

abstract class BaseViewModelInputs {
  void start(); //called when init of view model
  void dispose(); //called when viewmodel dies.
}

abstract class BaseViewModelOutputs {}
