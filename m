From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 79701] New: [NVA0] GPU lockup when playing video
	with VDPAU
Date: Thu, 05 Jun 2014 19:40:50 +0000
Message-ID: <bug-79701-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0338855939=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============0338855939==
Content-Type: multipart/alternative; boundary="1401997250.8BF8E1C1.21026"; charset="us-ascii"


--1401997250.8BF8E1C1.21026
Date: Thu, 5 Jun 2014 19:40:50 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=79701

          Priority: medium
            Bug ID: 79701
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: [NVA0] GPU lockup when playing video with VDPAU
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org
          Severity: normal
    Classification: Unclassified
                OS: Linux (All)
          Reporter: support.intranet-VGgt2q2+T+FeoWH0uzbU5w@public.gmane.org
          Hardware: x86-64 (AMD64)
            Status: NEW
           Version: unspecified
         Component: Driver/nouveau
           Product: xorg

Created attachment 100486
  --> https://bugs.freedesktop.org/attachment.cgi?id=100486&action=edit
dmesg after the GPU lock up

Hello,
I installed the vdpau mesa drivers for ubuntu trusty, extracted the firmware
from the blob and tried playing a video with mplayer. It played ok for a few
minutes (albeit with noticeable artifacts), then the gpu locked up - I could
only switch to a vt and reboot. The video codec is H264 - MPEG-4 AVC (part 10),
1920x802.

$ ls /lib/firmware/nouveau
nv84_bsp  nv84_bsp-h264  nv84_vp  nv84_vp-h264-1  nv84_vp-h264-2 
nv84_vp-mpeg12  nv84_vp-vc1-1  nv84_vp-vc1-2  nv84_vp-vc1-3  nv84_xuc00f 
nv84_xuc103

$ vdpauinfo
display: :0   screen: 0
API version: 1
Information string: G3DVL VDPAU Driver Shared Library version 1.0

Video surface:

name   width height types
-------------------------------------------
420     8192  8192  NV12 YV12 
422     8192  8192  UYVY YUYV 
444     8192  8192  Y8U8V8A8 V8U8Y8A8 

Decoder capabilities:

name               level macbs width height
-------------------------------------------
MPEG1                 0 16384  2048  2048
MPEG2_SIMPLE          3 16384  2048  2048
MPEG2_MAIN            3 16384  2048  2048
H264_BASELINE        41 16384  2048  2048
H264_MAIN            41 16384  2048  2048
H264_HIGH            41 16384  2048  2048

Output surface:

name              width height nat types
----------------------------------------------------
B8G8R8A8          8192  8192    y  NV12 YV12 UYVY YUYV Y8U8V8A8 V8U8Y8A8 
R8G8B8A8          8192  8192    y  NV12 YV12 UYVY YUYV Y8U8V8A8 V8U8Y8A8 
R10G10B10A2       8192  8192    y  NV12 YV12 UYVY YUYV Y8U8V8A8 V8U8Y8A8 
B10G10R10A2       8192  8192    y  NV12 YV12 UYVY YUYV Y8U8V8A8 V8U8Y8A8 

Bitmap surface:

name              width height
------------------------------
B8G8R8A8          8192  8192
R8G8B8A8          8192  8192
R10G10B10A2       8192  8192
B10G10R10A2       8192  8192
A8                8192  8192

Video mixer:

feature name                    sup
------------------------------------
DEINTERLACE_TEMPORAL             y
DEINTERLACE_TEMPORAL_SPATIAL     -
INVERSE_TELECINE                 -
NOISE_REDUCTION                  y
SHARPNESS                        y
LUMA_KEY                         -
HIGH QUALITY SCALING - L1        -
HIGH QUALITY SCALING - L2        -
HIGH QUALITY SCALING - L3        -
HIGH QUALITY SCALING - L4        -
HIGH QUALITY SCALING - L5        -
HIGH QUALITY SCALING - L6        -
HIGH QUALITY SCALING - L7        -
HIGH QUALITY SCALING - L8        -
HIGH QUALITY SCALING - L9        -

parameter name                  sup      min      max
-----------------------------------------------------
VIDEO_SURFACE_WIDTH              y        48     2048
VIDEO_SURFACE_HEIGHT             y        48     2048
CHROMA_TYPE                      y  
LAYERS                           y         0        4

attribute name                  sup      min      max
-----------------------------------------------------
BACKGROUND_COLOR                 y  
CSC_MATRIX                       y  
NOISE_REDUCTION_LEVEL            y      0.00     1.00
SHARPNESS_LEVEL                  y     -1.00     1.00
LUMA_KEY_MIN_LUMA                y  
LUMA_KEY_MAX_LUMA                y

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1401997250.8BF8E1C1.21026
Date: Thu, 5 Jun 2014 19:40:50 +0000
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
   title="NEW --- - [NVA0] GPU lockup when playing video with VDPAU"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=79701">79701</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>[NVA0] GPU lockup when playing video with VDPAU
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
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
          <td>support.intranet&#64;libero.it
          </td>
        </tr>

        <tr>
          <th>Hardware</th>
          <td>x86-64 (AMD64)
          </td>
        </tr>

        <tr>
          <th>Status</th>
          <td>NEW
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>unspecified
          </td>
        </tr>

        <tr>
          <th>Component</th>
          <td>Driver/nouveau
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>xorg
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=""><a href="attachment.cgi?id=100486" name="attach_100486" title="dmesg after the GPU lock up">attachment 100486</a> <a href="attachment.cgi?id=100486&amp;action=edit" title="dmesg after the GPU lock up">[details]</a></span>
dmesg after the GPU lock up

Hello,
I installed the vdpau mesa drivers for ubuntu trusty, extracted the firmware
from the blob and tried playing a video with mplayer. It played ok for a few
minutes (albeit with noticeable artifacts), then the gpu locked up - I could
only switch to a vt and reboot. The video codec is H264 - MPEG-4 AVC (part 10),
1920x802.

$ ls /lib/firmware/nouveau
nv84_bsp  nv84_bsp-h264  nv84_vp  nv84_vp-h264-1  nv84_vp-h264-2 
nv84_vp-mpeg12  nv84_vp-vc1-1  nv84_vp-vc1-2  nv84_vp-vc1-3  nv84_xuc00f 
nv84_xuc103

$ vdpauinfo
display: :0   screen: 0
API version: 1
Information string: G3DVL VDPAU Driver Shared Library version 1.0

Video surface:

name   width height types
-------------------------------------------
420     8192  8192  NV12 YV12 
422     8192  8192  UYVY YUYV 
444     8192  8192  Y8U8V8A8 V8U8Y8A8 

Decoder capabilities:

name               level macbs width height
-------------------------------------------
MPEG1                 0 16384  2048  2048
MPEG2_SIMPLE          3 16384  2048  2048
MPEG2_MAIN            3 16384  2048  2048
H264_BASELINE        41 16384  2048  2048
H264_MAIN            41 16384  2048  2048
H264_HIGH            41 16384  2048  2048

Output surface:

name              width height nat types
----------------------------------------------------
B8G8R8A8          8192  8192    y  NV12 YV12 UYVY YUYV Y8U8V8A8 V8U8Y8A8 
R8G8B8A8          8192  8192    y  NV12 YV12 UYVY YUYV Y8U8V8A8 V8U8Y8A8 
R10G10B10A2       8192  8192    y  NV12 YV12 UYVY YUYV Y8U8V8A8 V8U8Y8A8 
B10G10R10A2       8192  8192    y  NV12 YV12 UYVY YUYV Y8U8V8A8 V8U8Y8A8 

Bitmap surface:

name              width height
------------------------------
B8G8R8A8          8192  8192
R8G8B8A8          8192  8192
R10G10B10A2       8192  8192
B10G10R10A2       8192  8192
A8                8192  8192

Video mixer:

feature name                    sup
------------------------------------
DEINTERLACE_TEMPORAL             y
DEINTERLACE_TEMPORAL_SPATIAL     -
INVERSE_TELECINE                 -
NOISE_REDUCTION                  y
SHARPNESS                        y
LUMA_KEY                         -
HIGH QUALITY SCALING - L1        -
HIGH QUALITY SCALING - L2        -
HIGH QUALITY SCALING - L3        -
HIGH QUALITY SCALING - L4        -
HIGH QUALITY SCALING - L5        -
HIGH QUALITY SCALING - L6        -
HIGH QUALITY SCALING - L7        -
HIGH QUALITY SCALING - L8        -
HIGH QUALITY SCALING - L9        -

parameter name                  sup      min      max
-----------------------------------------------------
VIDEO_SURFACE_WIDTH              y        48     2048
VIDEO_SURFACE_HEIGHT             y        48     2048
CHROMA_TYPE                      y  
LAYERS                           y         0        4

attribute name                  sup      min      max
-----------------------------------------------------
BACKGROUND_COLOR                 y  
CSC_MATRIX                       y  
NOISE_REDUCTION_LEVEL            y      0.00     1.00
SHARPNESS_LEVEL                  y     -1.00     1.00
LUMA_KEY_MIN_LUMA                y  
LUMA_KEY_MAX_LUMA                y</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1401997250.8BF8E1C1.21026--

--===============0338855939==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0338855939==--
