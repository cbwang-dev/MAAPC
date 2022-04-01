clear;
param;

fprintf('Note that if ./rip/lin_ss_model.mat does not exist, you should type y.\n')
prompt = 'Do you want to check the evaluation results of linear state space model? (y/n) [default:n]: ';
txt = input(prompt,"s");
if isempty(txt)
    txt = 'n';
end
if txt == 'y'
  lin_state_space;
else
  fprintf('\n===============================================\n');
  fprintf('====== skipped linear state-space model. ======\n');
  fprintf('===============================================\n\n');
end

prompt = 'Do you want to check different results of LQR design? (y/n) [default:y]: ';
txt = input(prompt,"s");
if isempty(txt)
    txt = 'y';
end

if txt == 'y'
  fprintf(trial_display_str);
  prompt = 'Which trial do you want to run? Input index: ';
  trial_index = input(prompt);
  trial_name = trial_LUT(trial_index).name;
  Q = trial_LUT(trial_index).Q;
  R = trial_LUT(trial_index).R;
  LQR_design;
end