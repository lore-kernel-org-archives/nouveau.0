From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 73200] vdpau-GL interop fails due to different
	screen objects
Date: Wed, 01 Jan 2014 06:56:16 +0000
Message-ID: <bug-73200-8800-fsS5Tj4f8f@http.bugs.freedesktop.org/>
References: <bug-73200-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1196982740=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-73200-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============1196982740==
Content-Type: multipart/alternative; boundary="1388559376.CbE20.8041"; charset="us-ascii"


--1388559376.CbE20.8041
Date: Wed, 1 Jan 2014 06:56:16 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=73200

--- Comment #3 from Matthew Waters <ystreet00-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
The only 'app' I have is a gstreamer launch line with gstreamer-vaapi (git
master for some serious perf improvements) which looks like this:

LIBVA_DRIVER_NAME=vdpau gst-launch-1.0 playbin uri=file:///path/to/file.avi
video-sink='vaapisink use-glx=1'

The use-glx=1 flag is the thing that uses the NV_vdpau_interop path.

or with gst-plugins-gl (still requires gstreamer-vaapi for decoding) from git
(fd.o):

LIBVA_DRIVER_NAME=vdpau gst-launch-1.0 playbin uri=file:///path/to/file.avi
video-sink='glimagesink'

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1388559376.CbE20.8041
Date: Wed, 1 Jan 2014 06:56:16 +0000
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
   title="NEW --- - vdpau-GL interop fails due to different screen objects"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=73200#c3">Comment # 3</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - vdpau-GL interop fails due to different screen objects"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=73200">bug 73200</a>
              from <span class="vcard"><a class="email" href="mailto:ystreet00&#64;gmail.com" title="Matthew Waters &lt;ystreet00&#64;gmail.com&gt;"> <span class="fn">Matthew Waters</span></a>
</span></b>
        <pre>The only 'app' I have is a gstreamer launch line with gstreamer-vaapi (git
master for some serious perf improvements) which looks like this:

LIBVA_DRIVER_NAME=vdpau gst-launch-1.0 playbin uri=file:///path/to/file.avi
video-sink='vaapisink use-glx=1'

The use-glx=1 flag is the thing that uses the NV_vdpau_interop path.

or with gst-plugins-gl (still requires gstreamer-vaapi for decoding) from git
(fd.o):

LIBVA_DRIVER_NAME=vdpau gst-launch-1.0 playbin uri=file:///path/to/file.avi
video-sink='glimagesink'</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1388559376.CbE20.8041--

--===============1196982740==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1196982740==--
