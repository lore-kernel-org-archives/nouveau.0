From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 70130] New: unable to compile fragment shader program
Date: Fri, 04 Oct 2013 13:42:05 +0000
Message-ID: <bug-70130-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0353384445=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============0353384445==
Content-Type: multipart/alternative; boundary="1380894125.72a6CAbb0.12254"; charset="us-ascii"


--1380894125.72a6CAbb0.12254
Date: Fri, 4 Oct 2013 13:42:05 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=70130

          Priority: medium
            Bug ID: 70130
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: unable to compile fragment shader program
          Severity: normal
    Classification: Unclassified
                OS: Linux (All)
          Reporter: infyquest-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
          Hardware: x86 (IA32)
            Status: NEW
           Version: 9.2
         Component: Drivers/DRI/nouveau
           Product: Mesa

I have old geforce go 7900 inspiron e1705 laptop. On which I have archlinux
with nouveau (9.2.0-2)& mesa drivers.

I get the below error when i use the debug build

Error: failed to compile this fragment program:
FRAG
PROPERTY FS_COORD_ORIGIN LOWER_LEFT
PROPERTY FS_COLOR0_WRITES_ALL_CBUFS 1
DCL IN[0], POSITION, LINEAR
DCL IN[1], TEXCOORD[0], PERSPECTIVE
DCL IN[2], TEXCOORD[1], PERSPECTIVE
DCL IN[3], TEXCOORD[2], PERSPECTIVE
DCL IN[4], TEXCOORD[3], PERSPECTIVE
DCL IN[5], GENERIC[0], PERSPECTIVE
DCL OUT[0], COLOR
DCL SAMP[0]
DCL SAMP[1]
DCL SAMP[2]
DCL SAMP[3]
DCL SAMP[4]
DCL SAMP[5]
DCL CONST[19]
DCL CONST[0..2]
DCL CONST[4..13]
DCL TEMP[0]
DCL TEMP[1..13], LOCAL
IMM[0] FLT32 {    0.1250,     2.0000,     0.8000,     0.1000}
IMM[1] FLT32 {    7.5000,    -0.5000,     0.0000,     1.0000}
IMM[2] FLT32 {16384.0000,  4098.0000,    -1.0000,  4094.0000}
IMM[3] FLT32 {    0.0025,     0.0500,     0.9990,     0.0010}
IMM[4] FLT32 {    0.3333,     7.0000,     0.5000,   300.0000}
IMM[5] FLT32 {    0.2000,     0.0300,     8.0000,   100.0000}
IMM[6] FLT32 {  450.0000,     1.5000,     0.2500,     1.0500}
IMM[7] FLT32 {    1.3333,     1.4427,     5.0000,     0.0000}
  0: MOV TEMP[0], IN[0]
  1: MAD TEMP[0].y, IN[0], CONST[19].zzzz, CONST[19].wwww
  2: MUL TEMP[1].x, CONST[4].xxxx, IMM[0].xxxx
  3: MOV TEMP[2].xyz, -CONST[0].xyzx
  4: ADD TEMP[3].xyz, CONST[2].xyzz, -IN[5].xyzz
  5: DP3 TEMP[4].x, TEMP[3].xyzz, TEMP[3].xyzz
  6: RSQ TEMP[4].x, TEMP[4].xxxx
  7: MUL TEMP[3].xyz, TEMP[3].xyzz, TEMP[4].xxxx
  8: ADD TEMP[4].xyz, TEMP[2].xyzz, TEMP[3].xyzz
  9: MUL TEMP[5].x, CONST[4].xxxx, IMM[0].wwww
 10: LRP TEMP[5].x, TEMP[5].xxxx, IMM[0].zzzz, IMM[0].yyyy
 11: MAD TEMP[5].xy, IN[1].xyyy, TEMP[5].xxxx, IN[1].zwww
 12: MOV TEMP[5].xy, TEMP[5].xyyy
 13: TEX TEMP[5].xyz, TEMP[5], SAMP[1], 2D
 14: MUL TEMP[6].x, CONST[4].xxxx, IMM[0].wwww
 15: LRP TEMP[6].x, TEMP[6].xxxx, IMM[0].zzzz, IMM[0].yyyy
 16: MAD TEMP[6].xy, IN[1].xyyy, TEMP[6].xxxx, IN[1].zwww
 17: MOV TEMP[6].xy, TEMP[6].xyyy
 18: TEX TEMP[6].xyz, TEMP[6], SAMP[2], 2D
 19: MUL TEMP[7].x, IMM[1].xxxx, CONST[13].xxxx
 20: FRC TEMP[7].x, TEMP[7].xxxx
 21: LRP TEMP[5].xyz, TEMP[7].xxxx, TEMP[6].xzyy, TEMP[5].xzyy
 22: ADD TEMP[5].xyz, TEMP[5].xyzz, IMM[1].yyyy
 23: DP3 TEMP[6].x, TEMP[5].xyzz, TEMP[5].xyzz
 24: RSQ TEMP[6].x, TEMP[6].xxxx
 25: MUL TEMP[5].xyz, TEMP[5].xyzz, TEMP[6].xxxx
 26: LRP TEMP[6].xyz, TEMP[1].xxxx, TEMP[5].xyzz, IMM[1].zwzz
 27: MAD TEMP[7].x, IMM[0].yyyy, TEMP[0].zzzz, IMM[2].zzzz
 28: MUL TEMP[7].x, TEMP[7].xxxx, IMM[2].wwww
 29: ADD TEMP[7].x, IMM[2].yyyy, -TEMP[7].xxxx
 30: RCP TEMP[7].x, TEMP[7].xxxx
 31: MUL TEMP[7].x, IMM[2].xxxx, TEMP[7].xxxx
 32: RCP TEMP[8].x, CONST[12].xxxx
 33: RCP TEMP[8].y, CONST[12].yyyy
 34: MUL TEMP[8].xy, TEMP[0].xyyy, TEMP[8].xyyy
 35: MOV TEMP[8].xy, TEMP[8].xyyy
 36: TEX TEMP[8].x, TEMP[8], SAMP[5], 2D
 37: RCP TEMP[9].x, CONST[12].xxxx
 38: RCP TEMP[9].y, CONST[12].yyyy
 39: MAD TEMP[10].x, IMM[0].yyyy, TEMP[8].xxxx, IMM[2].zzzz
 40: MUL TEMP[10].x, TEMP[10].xxxx, IMM[2].wwww
 41: ADD TEMP[10].x, IMM[2].yyyy, -TEMP[10].xxxx
 42: RCP TEMP[10].x, TEMP[10].xxxx
 43: MAD TEMP[10].x, IMM[2].xxxx, TEMP[10].xxxx, -TEMP[7].xxxx
 44: MUL TEMP[10].x, TEMP[10].xxxx, IMM[3].xxxx
 45: MIN TEMP[10].x, TEMP[10].xxxx, IMM[3].yyyy
 46: MAX TEMP[10].x, TEMP[10].xxxx, IMM[1].zzzz
 47: MUL TEMP[10].xy, TEMP[6].xzzz, TEMP[10].xxxx
 48: MAD TEMP[9].xy, TEMP[0].xyyy, TEMP[9].xyyy, -TEMP[10].xyyy
 49: MIN TEMP[9].xy, TEMP[9].xyyy, IMM[3].zzzz
 50: MAX TEMP[9].xy, TEMP[9].xyyy, IMM[3].wwww
 51: MOV TEMP[9].xy, TEMP[9].xyyy
 52: TEX TEMP[9].x, TEMP[9], SAMP[5], 2D
 53: SLT TEMP[10].x, TEMP[9].xxxx, TEMP[8].xxxx
 54: CMP TEMP[8].x, -TEMP[10].xxxx, TEMP[8].xxxx, TEMP[9].xxxx
 55: MAD TEMP[8].x, IMM[0].yyyy, TEMP[8].xxxx, IMM[2].zzzz
 56: MUL TEMP[8].x, TEMP[8].xxxx, IMM[2].wwww
 57: ADD TEMP[8].x, IMM[2].yyyy, -TEMP[8].xxxx
 58: RCP TEMP[8].x, TEMP[8].xxxx
 59: MAD TEMP[7].x, IMM[2].xxxx, TEMP[8].xxxx, -TEMP[7].xxxx
 60: MUL TEMP[8].x, TEMP[7].xxxx, IMM[4].xxxx
 61: MIN TEMP[8].x, TEMP[8].xxxx, IMM[4].yyyy
 62: MAX TEMP[8].x, TEMP[8].xxxx, IMM[1].zzzz
 63: MUL TEMP[9].xy, TEMP[6].xzzz, TEMP[8].xxxx
 64: MAD TEMP[9].xy, IMM[4].zzzz, IN[3].xyyy, -TEMP[9].xyyy
 65: RCP TEMP[10].x, IN[3].wwww
 66: MAD_SAT TEMP[9].xy, TEMP[9].xyyy, TEMP[10].xxxx, IMM[4].zzzz
 67: MOV TEMP[9].xy, TEMP[9].xyyy
 68: TEX TEMP[9].xyz, TEMP[9], SAMP[4], 2D
 69: POW TEMP[10].x, CONST[6].xxxx, IMM[5].xxxx
 70: LRP TEMP[10].x, TEMP[10].xxxx, IMM[1].wwww, IMM[4].wwww
 71: RCP TEMP[10].x, TEMP[10].xxxx
 72: MUL_SAT TEMP[10].x, TEMP[7].xxxx, TEMP[10].xxxx
 73: ADD TEMP[10].x, IMM[1].wwww, -TEMP[10].xxxx
 74: MOV TEMP[11].xy, IN[4].xyyy
 75: TEX TEMP[11].w, TEMP[11], SAMP[0], 2D
 76: SLT TEMP[12].x, TEMP[11].wwww, IMM[5].yyyy
 77: ADD TEMP[12].x, -TEMP[12].xxxx, IMM[1].wwww
 78: CMP TEMP[11].x, -TEMP[12].xxxx, TEMP[11].wwww, IMM[1].zzzz
 79: RCP TEMP[12].x, TEMP[0].wwww
 80: MUL TEMP[12].x, TEMP[0].zzzz, TEMP[12].xxxx
 81: MUL TEMP[1].x, TEMP[1].xxxx, TEMP[3].yyyy
 82: MUL TEMP[1].x, TEMP[1].xxxx, IMM[5].zzzz
 83: MIN TEMP[1].x, TEMP[1].xxxx, IMM[1].wwww
 84: MAX TEMP[1].x, TEMP[1].xxxx, IMM[3].yyyy
 85: LRP TEMP[1].xyz, TEMP[1].xxxx, TEMP[5].xyzz, IMM[1].zwzz
 86: DP3 TEMP[5].x, TEMP[4].xyzz, TEMP[4].xyzz
 87: RSQ TEMP[5].x, TEMP[5].xxxx
 88: MUL TEMP[4].xyz, TEMP[4].xyzz, TEMP[5].xxxx
 89: DP3 TEMP[1].x, TEMP[1].xyzz, TEMP[4].xyzz
 90: MUL TEMP[4].x, TEMP[3].yyyy, IMM[0].yyyy
 91: LRP TEMP[4].x, TEMP[4].xxxx, IMM[6].xxxx, IMM[5].wwww
 92: POW TEMP[1].x, TEMP[1].xxxx, TEMP[4].xxxx
 93: MUL TEMP[1].xyz, TEMP[1].xxxx, CONST[1].xyzz
 94: MUL TEMP[4].xy, IMM[4].zzzz, IN[3].xyyy
 95: RCP TEMP[5].x, IN[3].wwww
 96: MAD TEMP[4].xy, TEMP[4].xyyy, TEMP[5].xxxx, IMM[4].zzzz
 97: MOV TEMP[4].xy, TEMP[4].xyyy
 98: TEX TEMP[4].xyz, TEMP[4], SAMP[4], 2D
 99: DP3 TEMP[2].x, TEMP[6].xyzz, TEMP[2].xyzz
100: ADD TEMP[2].x, TEMP[2].xxxx, IMM[1].wwww
101: MAD TEMP[2].x, TEMP[2].xxxx, IMM[6].zzzz, IMM[4].zzzz
102: MUL TEMP[5].xyz, TEMP[9].xyzz, CONST[5].xyzz
103: MUL TEMP[13].x, TEMP[7].xxxx, CONST[6].xxxx
104: MUL_SAT TEMP[13].x, TEMP[13].xxxx, IMM[5].xxxx
105: LRP TEMP[5].xyz, TEMP[13].xxxx, TEMP[5].xyzz, TEMP[9].xyzz
106: MUL TEMP[9].x, TEMP[10].xxxx, TEMP[10].xxxx
107: LRP TEMP[5].xyz, TEMP[9].xxxx, TEMP[5].xyzz, CONST[9].xyzz
108: MUL TEMP[2].xyz, TEMP[2].xxxx, TEMP[5].xyzz
109: MUL TEMP[5].x, TEMP[8].xxxx, IMM[6].yyyy
110: MUL TEMP[8].xy, IMM[4].zzzz, IN[2].xyyy
111: MAD TEMP[5].xy, TEMP[5].xxxx, TEMP[6].xzzz, TEMP[8].xyyy
112: RCP TEMP[8].x, IN[2].wwww
113: MAD_SAT TEMP[5].xy, TEMP[5].xyyy, TEMP[8].xxxx, IMM[4].zzzz
114: MOV TEMP[5].xy, TEMP[5].xyyy
115: TEX TEMP[5].xyz, TEMP[5], SAMP[3], 2D
116: MUL TEMP[8].xyz, CONST[1].xyzz, CONST[7].xyzz
117: LRP TEMP[5].xyz, CONST[8].xxxx, TEMP[8].xyzz, TEMP[5].xyzz
118: DP3_SAT TEMP[3].x, TEMP[6].xyzz, TEMP[3].xyzz
119: ADD TEMP[3].x, IMM[6].wwww, -TEMP[3].xxxx
120: POW TEMP[3].x, TEMP[3].xxxx, IMM[7].xxxx
121: LRP TEMP[2].xyz, TEMP[3].xxxx, TEMP[5].xyzz, TEMP[2].xyzz
122: MOV_SAT TEMP[3].x, TEMP[7].xxxx
123: LRP TEMP[2].xyz, TEMP[3].xxxx, TEMP[2].xyzz, TEMP[4].xyzz
124: MAD TEMP[1].xyz, TEMP[1].xyzz, IMM[6].yyyy, TEMP[2].xyzz
125: MUL TEMP[2].x, -CONST[11].xxxx, CONST[11].xxxx
126: MUL TEMP[2].x, TEMP[2].xxxx, TEMP[12].xxxx
127: MUL TEMP[2].x, TEMP[2].xxxx, TEMP[12].xxxx
128: MUL TEMP[2].x, TEMP[2].xxxx, IMM[7].yyyy
129: EX2 TEMP[2].x, TEMP[2].xxxx
130: ADD TEMP[3].x, IMM[1].wwww, -CONST[11].yyyy
131: MAD_SAT TEMP[2].x, TEMP[2].xxxx, TEMP[3].xxxx, CONST[11].yyyy
132: LRP TEMP[1].xyz, TEMP[2].xxxx, TEMP[1].xyzz, CONST[10].xyzz
133: MUL TEMP[1].xyz, TEMP[1].xyzz, TEMP[11].xxxx
134: MUL TEMP[2].x, IMM[7].zzzz, CONST[6].xxxx
135: MUL_SAT TEMP[2].x, TEMP[7].xxxx, TEMP[2].xxxx
136: MOV TEMP[1].w, TEMP[2].xxxx
137: MOV OUT[0], TEMP[1]
138: END

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1380894125.72a6CAbb0.12254
Date: Fri, 4 Oct 2013 13:42:05 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><table border="1" cellspacing="0" cellpadding="8">
        <tr>
          <th>Priority</th>
          <td>medium
          </td>
        </tr>

        <tr>
          <th>Bug ID</th>
          <td><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - unable to compile fragment shader program"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=70130">70130</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>unable to compile fragment shader program
          </td>
        </tr>

        <tr>
          <th>Severity</th>
          <td>normal
          </td>
        </tr>

        <tr>
          <th>Classification</th>
          <td>Unclassified
          </td>
        </tr>

        <tr>
          <th>OS</th>
          <td>Linux (All)
          </td>
        </tr>

        <tr>
          <th>Reporter</th>
          <td>infyquest&#64;gmail.com
          </td>
        </tr>

        <tr>
          <th>Hardware</th>
          <td>x86 (IA32)
          </td>
        </tr>

        <tr>
          <th>Status</th>
          <td>NEW
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>9.2
          </td>
        </tr>

        <tr>
          <th>Component</th>
          <td>Drivers/DRI/nouveau
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>Mesa
          </td>
        </tr></table>
      <p>
        <div>
        <pre>I have old geforce go 7900 inspiron e1705 laptop. On which I have archlinux
with nouveau (9.2.0-2)&amp; mesa drivers.

I get the below error when i use the debug build

Error: failed to compile this fragment program:
FRAG
PROPERTY FS_COORD_ORIGIN LOWER_LEFT
PROPERTY FS_COLOR0_WRITES_ALL_CBUFS 1
DCL IN[0], POSITION, LINEAR
DCL IN[1], TEXCOORD[0], PERSPECTIVE
DCL IN[2], TEXCOORD[1], PERSPECTIVE
DCL IN[3], TEXCOORD[2], PERSPECTIVE
DCL IN[4], TEXCOORD[3], PERSPECTIVE
DCL IN[5], GENERIC[0], PERSPECTIVE
DCL OUT[0], COLOR
DCL SAMP[0]
DCL SAMP[1]
DCL SAMP[2]
DCL SAMP[3]
DCL SAMP[4]
DCL SAMP[5]
DCL CONST[19]
DCL CONST[0..2]
DCL CONST[4..13]
DCL TEMP[0]
DCL TEMP[1..13], LOCAL
IMM[0] FLT32 {    0.1250,     2.0000,     0.8000,     0.1000}
IMM[1] FLT32 {    7.5000,    -0.5000,     0.0000,     1.0000}
IMM[2] FLT32 {16384.0000,  4098.0000,    -1.0000,  4094.0000}
IMM[3] FLT32 {    0.0025,     0.0500,     0.9990,     0.0010}
IMM[4] FLT32 {    0.3333,     7.0000,     0.5000,   300.0000}
IMM[5] FLT32 {    0.2000,     0.0300,     8.0000,   100.0000}
IMM[6] FLT32 {  450.0000,     1.5000,     0.2500,     1.0500}
IMM[7] FLT32 {    1.3333,     1.4427,     5.0000,     0.0000}
  0: MOV TEMP[0], IN[0]
  1: MAD TEMP[0].y, IN[0], CONST[19].zzzz, CONST[19].wwww
  2: MUL TEMP[1].x, CONST[4].xxxx, IMM[0].xxxx
  3: MOV TEMP[2].xyz, -CONST[0].xyzx
  4: ADD TEMP[3].xyz, CONST[2].xyzz, -IN[5].xyzz
  5: DP3 TEMP[4].x, TEMP[3].xyzz, TEMP[3].xyzz
  6: RSQ TEMP[4].x, TEMP[4].xxxx
  7: MUL TEMP[3].xyz, TEMP[3].xyzz, TEMP[4].xxxx
  8: ADD TEMP[4].xyz, TEMP[2].xyzz, TEMP[3].xyzz
  9: MUL TEMP[5].x, CONST[4].xxxx, IMM[0].wwww
 10: LRP TEMP[5].x, TEMP[5].xxxx, IMM[0].zzzz, IMM[0].yyyy
 11: MAD TEMP[5].xy, IN[1].xyyy, TEMP[5].xxxx, IN[1].zwww
 12: MOV TEMP[5].xy, TEMP[5].xyyy
 13: TEX TEMP[5].xyz, TEMP[5], SAMP[1], 2D
 14: MUL TEMP[6].x, CONST[4].xxxx, IMM[0].wwww
 15: LRP TEMP[6].x, TEMP[6].xxxx, IMM[0].zzzz, IMM[0].yyyy
 16: MAD TEMP[6].xy, IN[1].xyyy, TEMP[6].xxxx, IN[1].zwww
 17: MOV TEMP[6].xy, TEMP[6].xyyy
 18: TEX TEMP[6].xyz, TEMP[6], SAMP[2], 2D
 19: MUL TEMP[7].x, IMM[1].xxxx, CONST[13].xxxx
 20: FRC TEMP[7].x, TEMP[7].xxxx
 21: LRP TEMP[5].xyz, TEMP[7].xxxx, TEMP[6].xzyy, TEMP[5].xzyy
 22: ADD TEMP[5].xyz, TEMP[5].xyzz, IMM[1].yyyy
 23: DP3 TEMP[6].x, TEMP[5].xyzz, TEMP[5].xyzz
 24: RSQ TEMP[6].x, TEMP[6].xxxx
 25: MUL TEMP[5].xyz, TEMP[5].xyzz, TEMP[6].xxxx
 26: LRP TEMP[6].xyz, TEMP[1].xxxx, TEMP[5].xyzz, IMM[1].zwzz
 27: MAD TEMP[7].x, IMM[0].yyyy, TEMP[0].zzzz, IMM[2].zzzz
 28: MUL TEMP[7].x, TEMP[7].xxxx, IMM[2].wwww
 29: ADD TEMP[7].x, IMM[2].yyyy, -TEMP[7].xxxx
 30: RCP TEMP[7].x, TEMP[7].xxxx
 31: MUL TEMP[7].x, IMM[2].xxxx, TEMP[7].xxxx
 32: RCP TEMP[8].x, CONST[12].xxxx
 33: RCP TEMP[8].y, CONST[12].yyyy
 34: MUL TEMP[8].xy, TEMP[0].xyyy, TEMP[8].xyyy
 35: MOV TEMP[8].xy, TEMP[8].xyyy
 36: TEX TEMP[8].x, TEMP[8], SAMP[5], 2D
 37: RCP TEMP[9].x, CONST[12].xxxx
 38: RCP TEMP[9].y, CONST[12].yyyy
 39: MAD TEMP[10].x, IMM[0].yyyy, TEMP[8].xxxx, IMM[2].zzzz
 40: MUL TEMP[10].x, TEMP[10].xxxx, IMM[2].wwww
 41: ADD TEMP[10].x, IMM[2].yyyy, -TEMP[10].xxxx
 42: RCP TEMP[10].x, TEMP[10].xxxx
 43: MAD TEMP[10].x, IMM[2].xxxx, TEMP[10].xxxx, -TEMP[7].xxxx
 44: MUL TEMP[10].x, TEMP[10].xxxx, IMM[3].xxxx
 45: MIN TEMP[10].x, TEMP[10].xxxx, IMM[3].yyyy
 46: MAX TEMP[10].x, TEMP[10].xxxx, IMM[1].zzzz
 47: MUL TEMP[10].xy, TEMP[6].xzzz, TEMP[10].xxxx
 48: MAD TEMP[9].xy, TEMP[0].xyyy, TEMP[9].xyyy, -TEMP[10].xyyy
 49: MIN TEMP[9].xy, TEMP[9].xyyy, IMM[3].zzzz
 50: MAX TEMP[9].xy, TEMP[9].xyyy, IMM[3].wwww
 51: MOV TEMP[9].xy, TEMP[9].xyyy
 52: TEX TEMP[9].x, TEMP[9], SAMP[5], 2D
 53: SLT TEMP[10].x, TEMP[9].xxxx, TEMP[8].xxxx
 54: CMP TEMP[8].x, -TEMP[10].xxxx, TEMP[8].xxxx, TEMP[9].xxxx
 55: MAD TEMP[8].x, IMM[0].yyyy, TEMP[8].xxxx, IMM[2].zzzz
 56: MUL TEMP[8].x, TEMP[8].xxxx, IMM[2].wwww
 57: ADD TEMP[8].x, IMM[2].yyyy, -TEMP[8].xxxx
 58: RCP TEMP[8].x, TEMP[8].xxxx
 59: MAD TEMP[7].x, IMM[2].xxxx, TEMP[8].xxxx, -TEMP[7].xxxx
 60: MUL TEMP[8].x, TEMP[7].xxxx, IMM[4].xxxx
 61: MIN TEMP[8].x, TEMP[8].xxxx, IMM[4].yyyy
 62: MAX TEMP[8].x, TEMP[8].xxxx, IMM[1].zzzz
 63: MUL TEMP[9].xy, TEMP[6].xzzz, TEMP[8].xxxx
 64: MAD TEMP[9].xy, IMM[4].zzzz, IN[3].xyyy, -TEMP[9].xyyy
 65: RCP TEMP[10].x, IN[3].wwww
 66: MAD_SAT TEMP[9].xy, TEMP[9].xyyy, TEMP[10].xxxx, IMM[4].zzzz
 67: MOV TEMP[9].xy, TEMP[9].xyyy
 68: TEX TEMP[9].xyz, TEMP[9], SAMP[4], 2D
 69: POW TEMP[10].x, CONST[6].xxxx, IMM[5].xxxx
 70: LRP TEMP[10].x, TEMP[10].xxxx, IMM[1].wwww, IMM[4].wwww
 71: RCP TEMP[10].x, TEMP[10].xxxx
 72: MUL_SAT TEMP[10].x, TEMP[7].xxxx, TEMP[10].xxxx
 73: ADD TEMP[10].x, IMM[1].wwww, -TEMP[10].xxxx
 74: MOV TEMP[11].xy, IN[4].xyyy
 75: TEX TEMP[11].w, TEMP[11], SAMP[0], 2D
 76: SLT TEMP[12].x, TEMP[11].wwww, IMM[5].yyyy
 77: ADD TEMP[12].x, -TEMP[12].xxxx, IMM[1].wwww
 78: CMP TEMP[11].x, -TEMP[12].xxxx, TEMP[11].wwww, IMM[1].zzzz
 79: RCP TEMP[12].x, TEMP[0].wwww
 80: MUL TEMP[12].x, TEMP[0].zzzz, TEMP[12].xxxx
 81: MUL TEMP[1].x, TEMP[1].xxxx, TEMP[3].yyyy
 82: MUL TEMP[1].x, TEMP[1].xxxx, IMM[5].zzzz
 83: MIN TEMP[1].x, TEMP[1].xxxx, IMM[1].wwww
 84: MAX TEMP[1].x, TEMP[1].xxxx, IMM[3].yyyy
 85: LRP TEMP[1].xyz, TEMP[1].xxxx, TEMP[5].xyzz, IMM[1].zwzz
 86: DP3 TEMP[5].x, TEMP[4].xyzz, TEMP[4].xyzz
 87: RSQ TEMP[5].x, TEMP[5].xxxx
 88: MUL TEMP[4].xyz, TEMP[4].xyzz, TEMP[5].xxxx
 89: DP3 TEMP[1].x, TEMP[1].xyzz, TEMP[4].xyzz
 90: MUL TEMP[4].x, TEMP[3].yyyy, IMM[0].yyyy
 91: LRP TEMP[4].x, TEMP[4].xxxx, IMM[6].xxxx, IMM[5].wwww
 92: POW TEMP[1].x, TEMP[1].xxxx, TEMP[4].xxxx
 93: MUL TEMP[1].xyz, TEMP[1].xxxx, CONST[1].xyzz
 94: MUL TEMP[4].xy, IMM[4].zzzz, IN[3].xyyy
 95: RCP TEMP[5].x, IN[3].wwww
 96: MAD TEMP[4].xy, TEMP[4].xyyy, TEMP[5].xxxx, IMM[4].zzzz
 97: MOV TEMP[4].xy, TEMP[4].xyyy
 98: TEX TEMP[4].xyz, TEMP[4], SAMP[4], 2D
 99: DP3 TEMP[2].x, TEMP[6].xyzz, TEMP[2].xyzz
100: ADD TEMP[2].x, TEMP[2].xxxx, IMM[1].wwww
101: MAD TEMP[2].x, TEMP[2].xxxx, IMM[6].zzzz, IMM[4].zzzz
102: MUL TEMP[5].xyz, TEMP[9].xyzz, CONST[5].xyzz
103: MUL TEMP[13].x, TEMP[7].xxxx, CONST[6].xxxx
104: MUL_SAT TEMP[13].x, TEMP[13].xxxx, IMM[5].xxxx
105: LRP TEMP[5].xyz, TEMP[13].xxxx, TEMP[5].xyzz, TEMP[9].xyzz
106: MUL TEMP[9].x, TEMP[10].xxxx, TEMP[10].xxxx
107: LRP TEMP[5].xyz, TEMP[9].xxxx, TEMP[5].xyzz, CONST[9].xyzz
108: MUL TEMP[2].xyz, TEMP[2].xxxx, TEMP[5].xyzz
109: MUL TEMP[5].x, TEMP[8].xxxx, IMM[6].yyyy
110: MUL TEMP[8].xy, IMM[4].zzzz, IN[2].xyyy
111: MAD TEMP[5].xy, TEMP[5].xxxx, TEMP[6].xzzz, TEMP[8].xyyy
112: RCP TEMP[8].x, IN[2].wwww
113: MAD_SAT TEMP[5].xy, TEMP[5].xyyy, TEMP[8].xxxx, IMM[4].zzzz
114: MOV TEMP[5].xy, TEMP[5].xyyy
115: TEX TEMP[5].xyz, TEMP[5], SAMP[3], 2D
116: MUL TEMP[8].xyz, CONST[1].xyzz, CONST[7].xyzz
117: LRP TEMP[5].xyz, CONST[8].xxxx, TEMP[8].xyzz, TEMP[5].xyzz
118: DP3_SAT TEMP[3].x, TEMP[6].xyzz, TEMP[3].xyzz
119: ADD TEMP[3].x, IMM[6].wwww, -TEMP[3].xxxx
120: POW TEMP[3].x, TEMP[3].xxxx, IMM[7].xxxx
121: LRP TEMP[2].xyz, TEMP[3].xxxx, TEMP[5].xyzz, TEMP[2].xyzz
122: MOV_SAT TEMP[3].x, TEMP[7].xxxx
123: LRP TEMP[2].xyz, TEMP[3].xxxx, TEMP[2].xyzz, TEMP[4].xyzz
124: MAD TEMP[1].xyz, TEMP[1].xyzz, IMM[6].yyyy, TEMP[2].xyzz
125: MUL TEMP[2].x, -CONST[11].xxxx, CONST[11].xxxx
126: MUL TEMP[2].x, TEMP[2].xxxx, TEMP[12].xxxx
127: MUL TEMP[2].x, TEMP[2].xxxx, TEMP[12].xxxx
128: MUL TEMP[2].x, TEMP[2].xxxx, IMM[7].yyyy
129: EX2 TEMP[2].x, TEMP[2].xxxx
130: ADD TEMP[3].x, IMM[1].wwww, -CONST[11].yyyy
131: MAD_SAT TEMP[2].x, TEMP[2].xxxx, TEMP[3].xxxx, CONST[11].yyyy
132: LRP TEMP[1].xyz, TEMP[2].xxxx, TEMP[1].xyzz, CONST[10].xyzz
133: MUL TEMP[1].xyz, TEMP[1].xyzz, TEMP[11].xxxx
134: MUL TEMP[2].x, IMM[7].zzzz, CONST[6].xxxx
135: MUL_SAT TEMP[2].x, TEMP[7].xxxx, TEMP[2].xxxx
136: MOV TEMP[1].w, TEMP[2].xxxx
137: MOV OUT[0], TEMP[1]
138: END</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1380894125.72a6CAbb0.12254--

--===============0353384445==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0353384445==--
