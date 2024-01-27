function varargout = fopfinalq1(varargin)
% FOPFINALQ1 MATLAB code for fopfinalq1.fig
%      FOPFINALQ1, by itself, creates a new FOPFINALQ1 or raises the existing
%      singleton*.
%
%      H = FOPFINALQ1 returns the handle to a new FOPFINALQ1 or the handle to
%      the existing singleton*.
%
%      FOPFINALQ1('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in FOPFINALQ1.M with the given input arguments.
%
%      FOPFINALQ1('Property','Value',...) creates a new FOPFINALQ1 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before fopfinalq1_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to fopfinalq1_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help fopfinalq1

% Last Modified by GUIDE v2.5 15-Apr-2022 20:51:55

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @fopfinalq1_OpeningFcn, ...
                   'gui_OutputFcn',  @fopfinalq1_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before fopfinalq1 is made visible.
function fopfinalq1_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to fopfinalq1 (see VARARGIN)

% Choose default command line output for fopfinalq1
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes fopfinalq1 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = fopfinalq1_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function NT_Callback(hObject, eventdata, handles)
% hObject    handle to NT (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of NT as text
%        str2double(get(hObject,'String')) returns contents of NT as a double


% --- Executes during object creation, after setting all properties.
function NT_CreateFcn(hObject, eventdata, handles)
% hObject    handle to NT (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in translate_PB.
function translate_PB_Callback(hObject, eventdata, handles)
% hObject    handle to translate_PB (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

text=char(get(handles.NT, 'String'));
if isempty(text)
    errordlg('No input detected! Please insert appropriate input.','Error!');
    return
end
wordcounter=numel(strfind(text,' '))+1;
text=upper(text);
texttomorsecode = '';
morse={'.----','..---','...--','....-','.....','-....','--...','---..','----.','-----','.-','-...','-.-.','-..','.','..-.','--.','....','..','.---','-.-','.-..','--','-.','---','.--.','--.-','.-.','...','-','..-','...-','.--','-..-','-.--','--..','/','.-.-.-'}; 
NumberOrLetter={'1','2','3','4','5','6','7','8','9','0','A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z',' ','.'};
for k=1:length(text)
    character=text(k);
    [~, index]=ismember(character, NumberOrLetter);
    if any(index == false)
        errordlg('Invalid input! Please insert appropriate input.','Error!');
        set(handles.output1,'String','');
        set(handles.wordc1,'String','');
        return
    end
    if ~isempty(index)
        if isempty(texttomorsecode)
            texttomorsecode = morse{index};
        else
            texttomorsecode = [texttomorsecode ' ' morse{index}];
        end
    end
end

set(handles.output1,'String',texttomorsecode);
set(handles.wordc1,'String',wordcounter);
handles.texttomorsecode=texttomorsecode;
guidata(hObject, handles);


% --- Executes on button press in translate2_PB.
function translate2_PB_Callback(hObject, eventdata, handles)
% hObject    handle to translate2_PB (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

morsecode = char(get(handles.MC, 'String'));
if isempty(morsecode)
    errordlg('No input detected! Please insert appropriate input.','Error!');
    return
end

morse={'.----','..---','...--','....-','.....','-....','--...','---..','----.','-----','.-','-...','-.-.','-..','.','..-.','--.','....','..','.---','-.-','.-..','--','-.','---','.--.','--.-','.-.','...','-','..-','...-','.--','-..-','-.--','--..','/','.-.-.-'}; 
NumberOrLetter={'1','2','3','4','5','6','7','8','9','0','A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z',' ','.'};
ntext=strsplit(morsecode,' ');
ntext(cellfun(@isempty, ntext)) = [];
[~, index] = ismember(ntext, morse);
if any(index == false)
    errordlg('Invalid input! Please insert appropriate input.','Error!');
    set(handles.output2,'String','');
    set(handles.wordc2,'String','');
    return
end
morsecodetotext = [NumberOrLetter{index}];
set(handles.output2, 'String', morsecodetotext);
wordcounter2=numel(strfind(morsecodetotext,' '))+1;
set(handles.wordc2,'String',wordcounter2);
handles.morsecodetotext=morsecodetotext;
guidata(hObject, handles);

function MC_Callback(hObject, eventdata, handles)
% hObject    handle to MC (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of MC as text
%        str2double(get(hObject,'String')) returns contents of MC as a double


% --- Executes during object creation, after setting all properties.
function MC_CreateFcn(hObject, eventdata, handles)
% hObject    handle to MC (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --------------------------------------------------------------------
function Untitled_1_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_2_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function help_Callback(hObject, eventdata, handles)
% hObject    handle to help (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
helpdlg({'1)Translator is case-insensitive and will not affect translation process.','2)Letters from A-Z and numbers from 0-9 inputs allowed only for "Normal Text Message" input field.','3)Morse code inputs allowed only for "Morse Code Message" input field.','4)Right click on any of the input fields/edit text boxes to change its properties.','5)Please do not hit "Enter" to go to next line as it may disrupt the translation process.'},'Help');

% --------------------------------------------------------------------
function Untitled_25_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_25 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_26_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_26 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_27_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_27 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function RDC1_Callback(hObject, eventdata, handles)
% hObject    handle to RDC1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% default font size
set(handles.MC,'fontsize',13);

% default font family
set(handles.MC,'fontname','MS Sans Serif');

% default colour
set(handles.MC,'BackgroundColor',[1 1 1]);

% --------------------------------------------------------------------
function Untitled_21_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_21 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_22_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_22 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_23_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_23 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function RDC_Callback(hObject, eventdata, handles)
% hObject    handle to RDC (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% default font size
set(handles.NT,'fontsize',13);

% default font family
set(handles.NT,'fontname','MS Sans Serif');

% default colour
set(handles.NT,'BackgroundColor',[1 1 1]);

% --------------------------------------------------------------------
function Untitled_6_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_7_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_8_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function RD_Callback(hObject, eventdata, handles)
% hObject    handle to RD (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% default font size
set(handles.title,'fontsize',18);
set(handles.NT_title,'fontsize',13);
set(handles.MC_title,'fontsize',13);
set(handles.NT,'fontsize',13);
set(handles.MC,'fontsize',13);
set(handles.translate_PB,'fontsize',13);
set(handles.translate2_PB,'fontsize',13);
set(handles.output1,'fontsize',13);
set(handles.output2,'fontsize',13);
set(handles.output1_title,'fontsize',13);
set(handles.output2_title,'fontsize',13);
set(handles.wordtitle1,'fontsize',13);
set(handles.wordtitle2,'fontsize',13);
set(handles.wordc1,'fontsize',13);
set(handles.wordc2,'fontsize',13);


% default font family
set(handles.title,'fontname','MS Sans Serif');
set(handles.NT_title,'fontname','MS Sans Serif');
set(handles.MC_title,'fontname','MS Sans Serif');
set(handles.NT,'fontname','MS Sans Serif');
set(handles.MC,'fontname','MS Sans Serif');
set(handles.translate_PB,'fontname','MS Sans Serif');
set(handles.translate2_PB,'fontname','MS Sans Serif');
set(handles.output1,'fontname','MS Sans Serif');
set(handles.output2,'fontname','MS Sans Serif');
set(handles.output1_title,'fontname','MS Sans Serif');
set(handles.output2_title,'fontname','MS Sans Serif');
set(handles.wordtitle1,'fontname','MS Sans Serif');
set(handles.wordtitle2,'fontname','MS Sans Serif');
set(handles.wordc1,'fontname','MS Sans Serif');
set(handles.wordc2,'fontname','MS Sans Serif');

% default colour
set(handles.title,'BackgroundColor',[0.94 0.94 0.94]);
set(handles.NT_title,'BackgroundColor',[0.94 0.94 0.94]);
set(handles.MC_title,'BackgroundColor',[0.94 0.94 0.94]);
set(handles.NT,'BackgroundColor',[1 1 1]);
set(handles.MC,'BackgroundColor',[1 1 1]);
set(handles.translate_PB,'BackgroundColor',[0.94 0.94 0.94]);
set(handles.translate2_PB,'BackgroundColor',[0.94 0.94 0.94]);
set(handles.output1,'BackgroundColor',[1 1 1]);
set(handles.output2,'BackgroundColor',[1 1 1]);
set(handles.output1_title,'BackgroundColor',[0.94 0.94 0.94]);
set(handles.output2_title,'BackgroundColor',[0.94 0.94 0.94]);
set(handles.background,'BackgroundColor',[0.94 0.94 0.94]);
set(handles.wordtitle1,'BackgroundColor',[0.94 0.94 0.94]);
set(handles.wordtitle2,'BackgroundColor',[0.94 0.94 0.94]);
set(handles.wordc1,'BackgroundColor',[0.94 0.94 0.94]);
set(handles.wordc2,'BackgroundColor',[0.94 0.94 0.94]);

% default text colour
set(handles.title,'ForegroundColor',[0 0 0]);
set(handles.NT_title,'ForegroundColor',[0 0 0]);
set(handles.MC_title,'ForegroundColor',[0 0 0]);
set(handles.NT,'ForegroundColor',[0 0 0]);
set(handles.MC,'ForegroundColor',[0 0 0]);
set(handles.translate_PB,'ForegroundColor',[0 0 0]);
set(handles.translate2_PB,'ForegroundColor',[0 0 0]);
set(handles.output1,'ForegroundColor',[0 0 0]);
set(handles.output2,'ForegroundColor',[0 0 0]);
set(handles.output1_title,'ForegroundColor',[0 0 0]);
set(handles.output2_title,'ForegroundColor',[0 0 0]);
set(handles.background,'ForegroundColor',[0 0 0]);
set(handles.wordtitle1,'ForegroundColor',[0 0 0]);
set(handles.wordtitle2,'ForegroundColor',[0 0 0]);
set(handles.wordc1,'ForegroundColor',[0 0 0]);
set(handles.wordc2,'ForegroundColor',[0 0 0]);


% --------------------------------------------------------------------
function Untitled_4_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function pdf_Callback(hObject, eventdata, handles)
% hObject    handle to pdf (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
orient landscape
file=uiputfile('*.pdf');
print(file,'-dpdf');

% --------------------------------------------------------------------
function white_Callback(hObject, eventdata, handles)
% hObject    handle to white (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.title,'BackgroundColor',[0.94 0.94 0.94]);
set(handles.NT_title,'BackgroundColor',[0.94 0.94 0.94]);
set(handles.MC_title,'BackgroundColor',[0.94 0.94 0.94]);
set(handles.NT,'BackgroundColor',[1 1 1]);
set(handles.MC,'BackgroundColor',[1 1 1]);
set(handles.translate_PB,'BackgroundColor',[0.94 0.94 0.94]);
set(handles.translate2_PB,'BackgroundColor',[0.94 0.94 0.94]);
set(handles.output1,'BackgroundColor',[1 1 1]);
set(handles.output2,'BackgroundColor',[1 1 1]);
set(handles.output1_title,'BackgroundColor',[0.94 0.94 0.94]);
set(handles.output2_title,'BackgroundColor',[0.94 0.94 0.94]);
set(handles.background,'BackgroundColor',[0.94 0.94 0.94]);
set(handles.wordtitle1,'BackgroundColor',[0.94 0.94 0.94]);
set(handles.wordtitle2,'BackgroundColor',[0.94 0.94 0.94]);
set(handles.wordc1,'BackgroundColor',[0.94 0.94 0.94]);
set(handles.wordc2,'BackgroundColor',[0.94 0.94 0.94]);

set(handles.title,'ForegroundColor',[0 0 0]);
set(handles.NT_title,'ForegroundColor',[0 0 0]);
set(handles.MC_title,'ForegroundColor',[0 0 0]);
set(handles.NT,'ForegroundColor',[0 0 0]);
set(handles.MC,'ForegroundColor',[0 0 0]);
set(handles.translate_PB,'ForegroundColor',[0 0 0]);
set(handles.translate2_PB,'ForegroundColor',[0 0 0]);
set(handles.output1,'ForegroundColor',[0 0 0]);
set(handles.output2,'ForegroundColor',[0 0 0]);
set(handles.output1_title,'ForegroundColor',[0 0 0]);
set(handles.output2_title,'ForegroundColor',[0 0 0]);
set(handles.background,'ForegroundColor',[0 0 0]);
set(handles.wordtitle1,'ForegroundColor',[0 0 0]);
set(handles.wordtitle2,'ForegroundColor',[0 0 0]);
set(handles.wordc1,'ForegroundColor',[0 0 0]);
set(handles.wordc2,'ForegroundColor',[0 0 0]);

% --------------------------------------------------------------------
function yellow_Callback(hObject, eventdata, handles)
% hObject    handle to yellow (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.title,'BackgroundColor',[1 0.98 0.85]);
set(handles.NT_title,'BackgroundColor',[1 0.98 0.85]);
set(handles.MC_title,'BackgroundColor',[1 0.98 0.85]);
set(handles.NT,'BackgroundColor',[0.99 0.95 0.65]);
set(handles.MC,'BackgroundColor',[0.99 0.95 0.65]);
set(handles.translate_PB,'BackgroundColor',[1 0.98 0.85]);
set(handles.translate2_PB,'BackgroundColor',[1 0.98 0.85]);
set(handles.output1,'BackgroundColor',[0.99 0.95 0.65]);
set(handles.output2,'BackgroundColor',[0.99 0.95 0.65]);
set(handles.output1_title,'BackgroundColor',[1 0.98 0.85]);
set(handles.output2_title,'BackgroundColor',[1 0.98 0.85]);
set(handles.background,'BackgroundColor',[1 0.98 0.85]);
set(handles.wordtitle1,'BackgroundColor',[1 0.98 0.85]);
set(handles.wordtitle2,'BackgroundColor',[1 0.98 0.85]);
set(handles.wordc1,'BackgroundColor',[1 0.98 0.85]);
set(handles.wordc2,'BackgroundColor',[1 0.98 0.85]);

set(handles.title,'ForegroundColor',[0 0 0]);
set(handles.NT_title,'ForegroundColor',[0 0 0]);
set(handles.MC_title,'ForegroundColor',[0 0 0]);
set(handles.NT,'ForegroundColor',[0 0 0]);
set(handles.MC,'ForegroundColor',[0 0 0]);
set(handles.translate_PB,'ForegroundColor',[0 0 0]);
set(handles.translate2_PB,'ForegroundColor',[0 0 0]);
set(handles.output1,'ForegroundColor',[0 0 0]);
set(handles.output2,'ForegroundColor',[0 0 0]);
set(handles.output1_title,'ForegroundColor',[0 0 0]);
set(handles.output2_title,'ForegroundColor',[0 0 0]);
set(handles.background,'ForegroundColor',[0 0 0]);
set(handles.wordtitle1,'ForegroundColor',[0 0 0]);
set(handles.wordtitle2,'ForegroundColor',[0 0 0]);
set(handles.wordc1,'ForegroundColor',[0 0 0]);
set(handles.wordc2,'ForegroundColor',[0 0 0]);

% --------------------------------------------------------------------
function pink_Callback(hObject, eventdata, handles)
% hObject    handle to pink (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.title,'BackgroundColor',[1 0.91 0.98]);
set(handles.NT_title,'BackgroundColor',[1 0.91 0.98]);
set(handles.MC_title,'BackgroundColor',[1 0.91 0.98]);
set(handles.NT,'BackgroundColor',[0.97 0.76 0.93]);
set(handles.MC,'BackgroundColor',[0.97 0.76 0.93]);
set(handles.translate_PB,'BackgroundColor',[1 0.91 0.98]);
set(handles.translate2_PB,'BackgroundColor',[1 0.91 0.98]);
set(handles.output1,'BackgroundColor',[0.97 0.76 0.93]);
set(handles.output2,'BackgroundColor',[0.97 0.76 0.93]);
set(handles.output1_title,'BackgroundColor',[1 0.91 0.98]);
set(handles.output2_title,'BackgroundColor',[1 0.91 0.98]);
set(handles.background,'BackgroundColor',[1 0.91 0.98]);
set(handles.wordtitle1,'BackgroundColor',[1 0.91 0.98]);
set(handles.wordtitle2,'BackgroundColor',[1 0.91 0.98]);
set(handles.wordc1,'BackgroundColor',[1 0.91 0.98]);
set(handles.wordc2,'BackgroundColor',[1 0.91 0.98]);

set(handles.title,'ForegroundColor',[0 0 0]);
set(handles.NT_title,'ForegroundColor',[0 0 0]);
set(handles.MC_title,'ForegroundColor',[0 0 0]);
set(handles.NT,'ForegroundColor',[0 0 0]);
set(handles.MC,'ForegroundColor',[0 0 0]);
set(handles.translate_PB,'ForegroundColor',[0 0 0]);
set(handles.translate2_PB,'ForegroundColor',[0 0 0]);
set(handles.output1,'ForegroundColor',[0 0 0]);
set(handles.output2,'ForegroundColor',[0 0 0]);
set(handles.output1_title,'ForegroundColor',[0 0 0]);
set(handles.output2_title,'ForegroundColor',[0 0 0]);
set(handles.background,'ForegroundColor',[0 0 0]);
set(handles.wordtitle1,'ForegroundColor',[0 0 0]);
set(handles.wordtitle2,'ForegroundColor',[0 0 0]);
set(handles.wordc1,'ForegroundColor',[0 0 0]);
set(handles.wordc2,'ForegroundColor',[0 0 0]);

% --------------------------------------------------------------------
function small_Callback(hObject, eventdata, handles)
% hObject    handle to small (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.title,'fontsize',13);
set(handles.NT_title,'fontsize',8);
set(handles.MC_title,'fontsize',8);
set(handles.NT,'fontsize',8);
set(handles.MC,'fontsize',8);
set(handles.translate_PB,'fontsize',8);
set(handles.translate2_PB,'fontsize',8);
set(handles.output1,'fontsize',8);
set(handles.output2,'fontsize',8);
set(handles.output1_title,'fontsize',8);
set(handles.output2_title,'fontsize',8);
set(handles.wordtitle1,'fontsize',8);
set(handles.wordtitle2,'fontsize',8);
set(handles.wordc1,'fontsize',8);
set(handles.wordc2,'fontsize',8);

% --------------------------------------------------------------------
function medium_Callback(hObject, eventdata, handles)
% hObject    handle to medium (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.title,'fontsize',18);
set(handles.NT_title,'fontsize',13);
set(handles.MC_title,'fontsize',13);
set(handles.NT,'fontsize',13);
set(handles.MC,'fontsize',13);
set(handles.translate_PB,'fontsize',13);
set(handles.translate2_PB,'fontsize',13);
set(handles.output1,'fontsize',13);
set(handles.output2,'fontsize',13);
set(handles.output1_title,'fontsize',13);
set(handles.output2_title,'fontsize',13);
set(handles.wordtitle1,'fontsize',13);
set(handles.wordtitle2,'fontsize',13);
set(handles.wordc1,'fontsize',13);
set(handles.wordc2,'fontsize',13);

% --------------------------------------------------------------------
function large_Callback(hObject, eventdata, handles)
% hObject    handle to large (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.title,'fontsize',23);
set(handles.NT_title,'fontsize',18);
set(handles.MC_title,'fontsize',18);
set(handles.NT,'fontsize',18);
set(handles.MC,'fontsize',18);
set(handles.translate_PB,'fontsize',18);
set(handles.translate2_PB,'fontsize',18);
set(handles.output1,'fontsize',18);
set(handles.output2,'fontsize',18);
set(handles.output1_title,'fontsize',18);
set(handles.output2_title,'fontsize',18);
set(handles.wordtitle1,'fontsize',18);
set(handles.wordtitle2,'fontsize',18);
set(handles.wordc1,'fontsize',18);
set(handles.wordc2,'fontsize',18);

% --------------------------------------------------------------------
function MSS_Callback(hObject, eventdata, handles)
% hObject    handle to MSS (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.title,'fontname','MS Sans Serif');
set(handles.NT_title,'fontname','MS Sans Serif');
set(handles.MC_title,'fontname','MS Sans Serif');
set(handles.NT,'fontname','MS Sans Serif');
set(handles.MC,'fontname','MS Sans Serif');
set(handles.translate_PB,'fontname','MS Sans Serif');
set(handles.translate2_PB,'fontname','MS Sans Serif');
set(handles.output1,'fontname','MS Sans Serif');
set(handles.output2,'fontname','MS Sans Serif');
set(handles.output1_title,'fontname','MS Sans Serif');
set(handles.output2_title,'fontname','MS Sans Serif');
set(handles.wordtitle1,'fontname','MS Sans Serif');
set(handles.wordtitle2,'fontname','MS Sans Serif');
set(handles.wordc1,'fontname','MS Sans Serif');
set(handles.wordc2,'fontname','MS Sans Serif');

% --------------------------------------------------------------------
function TMS_Callback(hObject, eventdata, handles)
% hObject    handle to TMS (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.title,'fontname','Trebuchet MS');
set(handles.NT_title,'fontname','Trebuchet MS');
set(handles.MC_title,'fontname','Trebuchet MS');
set(handles.NT,'fontname','Trebuchet MS');
set(handles.MC,'fontname','Trebuchet MS');
set(handles.translate_PB,'fontname','Trebuchet MS');
set(handles.translate2_PB,'fontname','Trebuchet MS');
set(handles.output1,'fontname','Trebuchet MS');
set(handles.output2,'fontname','Trebuchet MS');
set(handles.output1_title,'fontname','Trebuchet MS');
set(handles.output2_title,'fontname','Trebuchet MS');
set(handles.wordtitle1,'fontname','Trebuchet MS');
set(handles.wordtitle2,'fontname','Trebuchet MS');
set(handles.wordc1,'fontname','Trebuchet MS');
set(handles.wordc2,'fontname','Trebuchet MS');

% --------------------------------------------------------------------
function cambria_Callback(hObject, eventdata, handles)
% hObject    handle to cambria (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.title,'fontname','Cambria');
set(handles.NT_title,'fontname','Cambria');
set(handles.MC_title,'fontname','Cambria');
set(handles.NT,'fontname','Cambria');
set(handles.MC,'fontname','Cambria');
set(handles.translate_PB,'fontname','Cambria');
set(handles.translate2_PB,'fontname','Cambria');
set(handles.output1,'fontname','Cambria');
set(handles.output2,'fontname','Cambria');
set(handles.output1_title,'fontname','Cambria');
set(handles.output2_title,'fontname','Cambria');
set(handles.wordtitle1,'fontname','Cambria');
set(handles.wordtitle2,'fontname','Cambria');
set(handles.wordc1,'fontname','Cambria');
set(handles.wordc2,'fontname','Cambria');

% --------------------------------------------------------------------
function WC_Callback(hObject, eventdata, handles)
% hObject    handle to WC (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.NT,'BackgroundColor',[1 1 1]);

% --------------------------------------------------------------------
function YC_Callback(hObject, eventdata, handles)
% hObject    handle to YC (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.NT,'BackgroundColor',[0.99 0.95 0.65]);

% --------------------------------------------------------------------
function PC_Callback(hObject, eventdata, handles)
% hObject    handle to PC (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.NT,'BackgroundColor',[0.97 0.76 0.93]);

% --------------------------------------------------------------------
function SC_Callback(hObject, eventdata, handles)
% hObject    handle to SC (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.NT,'fontsize',8);

% --------------------------------------------------------------------
function MediumC_Callback(hObject, eventdata, handles)
% hObject    handle to MediumC (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.NT,'fontsize',13);

% --------------------------------------------------------------------
function LC_Callback(hObject, eventdata, handles)
% hObject    handle to LC (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.NT,'fontsize',18);

% --------------------------------------------------------------------
function MSSC_Callback(hObject, eventdata, handles)
% hObject    handle to MSSC (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.NT,'fontname','MS Sans Serif');

% --------------------------------------------------------------------
function TMSC_Callback(hObject, eventdata, handles)
% hObject    handle to TMSC (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.NT,'fontname','Trebuchet MS');

% --------------------------------------------------------------------
function CC_Callback(hObject, eventdata, handles)
% hObject    handle to CC (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.NT,'fontname','Cambria');

% --------------------------------------------------------------------
function WC1_Callback(hObject, eventdata, handles)
% hObject    handle to WC1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.MC,'BackgroundColor',[1 1 1]);

% --------------------------------------------------------------------
function YC1_Callback(hObject, eventdata, handles)
% hObject    handle to YC1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.MC,'BackgroundColor',[0.99 0.95 0.65]);

% --------------------------------------------------------------------
function PC1_Callback(hObject, eventdata, handles)
% hObject    handle to PC1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.MC,'BackgroundColor',[0.97 0.76 0.93]);

% --------------------------------------------------------------------
function SC1_Callback(hObject, eventdata, handles)
% hObject    handle to SC1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.MC,'fontsize',8);

% --------------------------------------------------------------------
function MediumC1_Callback(hObject, eventdata, handles)
% hObject    handle to MediumC1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.MC,'fontsize',13);

% --------------------------------------------------------------------
function LC1_Callback(hObject, eventdata, handles)
% hObject    handle to LC1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.MC,'fontsize',18);

% --------------------------------------------------------------------
function MSSC1_Callback(hObject, eventdata, handles)
% hObject    handle to MSSC1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.MC,'fontname','MS Sans Serif');

% --------------------------------------------------------------------
function TMSC1_Callback(hObject, eventdata, handles)
% hObject    handle to TMSC1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.MC,'fontname','Trebuchet MS');

% --------------------------------------------------------------------
function CC1_Callback(hObject, eventdata, handles)
% hObject    handle to CC1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.MC,'fontname','Cambria');

% --------------------------------------------------------------------
function Properties_Callback(hObject, eventdata, handles)
% hObject    handle to Properties (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Properties2_Callback(hObject, eventdata, handles)
% hObject    handle to Properties2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function output1_Callback(hObject, eventdata, handles)
% hObject    handle to output1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of output1 as text
%        str2double(get(hObject,'String')) returns contents of output1 as a double


% --- Executes during object creation, after setting all properties.
function output1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to output1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function output2_Callback(hObject, eventdata, handles)
% hObject    handle to output2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of output2 as text
%        str2double(get(hObject,'String')) returns contents of output2 as a double


% --- Executes during object creation, after setting all properties.
function output2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to output2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --------------------------------------------------------------------
function Untitled_34_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_34 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_35_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_35 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_36_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_36 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function RDC3_Callback(hObject, eventdata, handles)
% hObject    handle to RDC3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% default font size
set(handles.output2,'fontsize',13);

% default font family
set(handles.output2,'fontname','MS Sans Serif');

% default colour
set(handles.output2,'BackgroundColor',[1 1 1]);

% --------------------------------------------------------------------
function Untitled_30_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_30 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_31_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_31 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_32_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_32 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function RDC2_Callback(hObject, eventdata, handles)
% hObject    handle to RDC2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% default font size
set(handles.output1,'fontsize',13);

% default font family
set(handles.output1,'fontname','MS Sans Serif');

% default colour
set(handles.output1,'BackgroundColor',[1 1 1]);

% --------------------------------------------------------------------
function WC2_Callback(hObject, eventdata, handles)
% hObject    handle to WC2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.output1,'BackgroundColor',[1 1 1]);

% --------------------------------------------------------------------
function YC2_Callback(hObject, eventdata, handles)
% hObject    handle to YC2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.output1,'BackgroundColor',[0.99 0.95 0.65]);

% --------------------------------------------------------------------
function PC2_Callback(hObject, eventdata, handles)
% hObject    handle to PC2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.output1,'BackgroundColor',[0.97 0.76 0.93]);

% --------------------------------------------------------------------
function SC2_Callback(hObject, eventdata, handles)
% hObject    handle to SC2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.output1,'fontsize',8);

% --------------------------------------------------------------------
function MediumC2_Callback(hObject, eventdata, handles)
% hObject    handle to MediumC2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.output1,'fontsize',13);

% --------------------------------------------------------------------
function LC2_Callback(hObject, eventdata, handles)
% hObject    handle to LC2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.output1,'fontsize',18);

% --------------------------------------------------------------------
function MSSC2_Callback(hObject, eventdata, handles)
% hObject    handle to MSSC2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.output1,'fontname','MS Sans Serif');

% --------------------------------------------------------------------
function TMSC2_Callback(hObject, eventdata, handles)
% hObject    handle to TMSC2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.output1,'fontname','Trebuchet MS');

% --------------------------------------------------------------------
function CC2_Callback(hObject, eventdata, handles)
% hObject    handle to CC2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.output1,'fontname','Cambria');

% --------------------------------------------------------------------
function WC3_Callback(hObject, eventdata, handles)
% hObject    handle to WC3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.output2,'BackgroundColor',[1 1 1]);

% --------------------------------------------------------------------
function YC3_Callback(hObject, eventdata, handles)
% hObject    handle to YC3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.output2,'BackgroundColor',[0.99 0.95 0.65]);

% --------------------------------------------------------------------
function PC3_Callback(hObject, eventdata, handles)
% hObject    handle to PC3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.output2,'BackgroundColor',[0.97 0.76 0.93]);

% --------------------------------------------------------------------
function SC3_Callback(hObject, eventdata, handles)
% hObject    handle to SC3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.output2,'fontsize',8);

% --------------------------------------------------------------------
function MediumC3_Callback(hObject, eventdata, handles)
% hObject    handle to MediumC3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.output2,'fontsize',13);

% --------------------------------------------------------------------
function LC3_Callback(hObject, eventdata, handles)
% hObject    handle to LC3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.output2,'fontsize',18);

% --------------------------------------------------------------------
function MSSC3_Callback(hObject, eventdata, handles)
% hObject    handle to MSSC3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.output2,'fontname','MS Sans Serif');

% --------------------------------------------------------------------
function TMSC3_Callback(hObject, eventdata, handles)
% hObject    handle to TMSC3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.output2,'fontname','Trebuchet MS');

% --------------------------------------------------------------------
function CC3_Callback(hObject, eventdata, handles)
% hObject    handle to CC3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.output2,'fontname','Cambria');

% --------------------------------------------------------------------
function Properties3_Callback(hObject, eventdata, handles)
% hObject    handle to Properties3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Properties4_Callback(hObject, eventdata, handles)
% hObject    handle to Properties4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_37_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_37 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function lightmode_Callback(hObject, eventdata, handles)
% hObject    handle to lightmode (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.title,'BackgroundColor',[0.94 0.94 0.94]);
set(handles.NT_title,'BackgroundColor',[0.94 0.94 0.94]);
set(handles.MC_title,'BackgroundColor',[0.94 0.94 0.94]);
set(handles.NT,'BackgroundColor',[1 1 1]);
set(handles.MC,'BackgroundColor',[1 1 1]);
set(handles.translate_PB,'BackgroundColor',[0.94 0.94 0.94]);
set(handles.translate2_PB,'BackgroundColor',[0.94 0.94 0.94]);
set(handles.output1,'BackgroundColor',[1 1 1]);
set(handles.output2,'BackgroundColor',[1 1 1]);
set(handles.output1_title,'BackgroundColor',[0.94 0.94 0.94]);
set(handles.output2_title,'BackgroundColor',[0.94 0.94 0.94]);
set(handles.background,'BackgroundColor',[0.94 0.94 0.94]);
set(handles.wordtitle1,'BackgroundColor',[0.94 0.94 0.94]);
set(handles.wordtitle2,'BackgroundColor',[0.94 0.94 0.94]);
set(handles.wordc1,'BackgroundColor',[0.94 0.94 0.94]);
set(handles.wordc2,'BackgroundColor',[0.94 0.94 0.94]);

set(handles.title,'ForegroundColor',[0 0 0]);
set(handles.NT_title,'ForegroundColor',[0 0 0]);
set(handles.MC_title,'ForegroundColor',[0 0 0]);
set(handles.NT,'ForegroundColor',[0 0 0]);
set(handles.MC,'ForegroundColor',[0 0 0]);
set(handles.translate_PB,'ForegroundColor',[0 0 0]);
set(handles.translate2_PB,'ForegroundColor',[0 0 0]);
set(handles.output1,'ForegroundColor',[0 0 0]);
set(handles.output2,'ForegroundColor',[0 0 0]);
set(handles.output1_title,'ForegroundColor',[0 0 0]);
set(handles.output2_title,'ForegroundColor',[0 0 0]);
set(handles.background,'ForegroundColor',[0 0 0]);
set(handles.wordtitle1,'ForegroundColor',[0 0 0]);
set(handles.wordtitle2,'ForegroundColor',[0 0 0]);
set(handles.wordc1,'ForegroundColor',[0 0 0]);
set(handles.wordc2,'ForegroundColor',[0 0 0]);

% --------------------------------------------------------------------
function darkmode_Callback(hObject, eventdata, handles)
% hObject    handle to darkmode (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.title,'BackgroundColor',[0.17 0.18 0.2]);
set(handles.NT_title,'BackgroundColor',[0.17 0.18 0.2]);
set(handles.MC_title,'BackgroundColor',[0.17 0.18 0.2]);
set(handles.NT,'BackgroundColor',[0.6 0.67 0.71]);
set(handles.MC,'BackgroundColor',[0.6 0.67 0.71]);
set(handles.translate_PB,'BackgroundColor',[0.6 0.67 0.71]);
set(handles.translate2_PB,'BackgroundColor',[0.6 0.67 0.71]);
set(handles.output1,'BackgroundColor',[0.6 0.67 0.71]);
set(handles.output2,'BackgroundColor',[0.6 0.67 0.71]);
set(handles.output1_title,'BackgroundColor',[0.17 0.18 0.2]);
set(handles.output2_title,'BackgroundColor',[0.17 0.18 0.2]);
set(handles.background,'BackgroundColor',[0.17 0.18 0.2]);
set(handles.wordtitle1,'BackgroundColor',[0.17 0.18 0.2]);
set(handles.wordtitle2,'BackgroundColor',[0.17 0.18 0.2]);
set(handles.wordc1,'BackgroundColor',[0.17 0.18 0.2]);
set(handles.wordc2,'BackgroundColor',[0.17 0.18 0.2]);

set(handles.title,'ForegroundColor',[1 1 1]);
set(handles.NT_title,'ForegroundColor',[1 1 1]);
set(handles.MC_title,'ForegroundColor',[1 1 1]);
set(handles.NT,'ForegroundColor',[1 1 1]);
set(handles.MC,'ForegroundColor',[1 1 1]);
set(handles.translate_PB,'ForegroundColor',[1 1 1]);
set(handles.translate2_PB,'ForegroundColor',[1 1 1]);
set(handles.output1,'ForegroundColor',[1 1 1]);
set(handles.output2,'ForegroundColor',[1 1 1]);
set(handles.output1_title,'ForegroundColor',[1 1 1]);
set(handles.output2_title,'ForegroundColor',[1 1 1]);
set(handles.background,'ForegroundColor',[1 1 1]);
set(handles.wordtitle1,'ForegroundColor',[1 1 1]);
set(handles.wordtitle2,'ForegroundColor',[1 1 1]);
set(handles.wordc1,'ForegroundColor',[1 1 1]);
set(handles.wordc2,'ForegroundColor',[1 1 1]);


% --------------------------------------------------------------------
function Untitled_38_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_38 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function t2m_Callback(hObject, eventdata, handles)
% hObject    handle to t2m (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
try
    texttomorsecode=handles.texttomorsecode;
    fid = fopen('texttomorsecode.txt','wb');
    fprintf(fid, texttomorsecode,'char');
    fclose(fid);
    warndlg('Please rename previously generated text file(s) to names other than "texttomorsecode.txt" if you wish to export another text file. Otherwise, older text file with identical name will be overwritten.','Disclaimer!');
catch
    errordlg('No data available to export!','Error!');
end

% --------------------------------------------------------------------
function m2t_Callback(hObject, eventdata, handles)
% hObject    handle to m2t (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
try
    morsecodetotext=handles.morsecodetotext;
    fid = fopen('morsecodetotext.txt','wb');
    fprintf(fid, morsecodetotext,'char');
    fclose(fid);
    warndlg('Please rename previously generated text file(s) to names other than "morsecodetotext.txt" if you wish to export another text file. Otherwise, older text file with identical name will be overwritten.','Disclaimer!');
catch
    errordlg('No data available to export!','Error!');
end
