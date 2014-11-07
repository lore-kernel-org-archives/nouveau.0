From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 86006] [NV84] Nvidia GeForce 8600 GT VDPAU h264
 hardware acceleration
Date: Fri, 07 Nov 2014 15:07:53 +0000
Message-ID: <bug-86006-8800-xHgkx87DHO@http.bugs.freedesktop.org/>
References: <bug-86006-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1163607164=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-86006-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1163607164==
Content-Type: multipart/alternative; boundary="1415372873.F4E011.1029"; charset="UTF-8"


--1415372873.F4E011.1029
Date: Fri, 7 Nov 2014 15:07:53 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=86006

--- Comment #2 from Ilya Indigo <13ilya-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
[code]ilya@ilya:~> vdpauinfo        
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
LUMA_KEY_MAX_LUMA [/code]

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1415372873.F4E011.1029
Date: Fri, 7 Nov 2014 15:07:53 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NV84] Nvidia GeForce 8600 GT VDPAU h264 hardware acceleration"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=86006#c2">Comment # 2</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NV84] Nvidia GeForce 8600 GT VDPAU h264 hardware acceleration"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=86006">bug 86006</a>
              from <span class="vcard"><a class="email" href="mailto:13ilya&#64;gmail.com" title="Ilya Indigo &lt;13ilya&#64;gmail.com&gt;"> <span class="fn">Ilya Indigo</span></a>
</span></b>
        <pre>[code]ilya&#64;ilya:~&gt; vdpauinfo        
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
LUMA_KEY_MAX_LUMA [/code]</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1415372873.F4E011.1029--

--===============1163607164==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1163607164==--
