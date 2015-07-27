From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 89969] vaDriverInit fails with gallium/nouveau driver
Date: Mon, 27 Jul 2015 17:30:59 +0000
Message-ID: <bug-89969-8800-82cl36jzpc@http.bugs.freedesktop.org/>
References: <bug-89969-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1012849944=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-89969-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1012849944==
Content-Type: multipart/alternative; boundary="1438018260.adf0c8A2.27612"; charset="UTF-8"


--1438018260.adf0c8A2.27612
Date: Mon, 27 Jul 2015 17:31:00 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=89969

--- Comment #14 from Julien Isorce <julien.isorce-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Created attachment 117399
  --> https://bugs.freedesktop.org/attachment.cgi?id=117399&action=edit
2 valgrind outputs to compare failure case with working reference case

Failure:
LIBVA_DRIVER_NAME=gallium valgrind --tool=mmt --mmt-trace-nouveau-ioctls
--log-file=va_mesa_bin.log gst-launch-1.0 filesrc
location=/home/SERILOCAL/j.isorce/Downloads/centaur_2.mpg num-buffers=6 !
mpegpsdemux ! mpegvideoparse ! vaapideco^C ! tee ! vdieoconvert ! xvimagesink

Success:
LIBVA_DRIVER_NAME=vdpau valgrind --tool=mmt --mmt-trace-nouveau-ioctls
--log-file=va_over_vdpau_mesa_bin.log gst-launch-1.0 filesrc
location=/home/SERILOCAL/j.isorce/Downloads/centaur_2.mpg num-buffers=6 !
mpegpsdemux ! mpegvideoparse ! vaapidecode ! tee ! videoconvert ! xvimagesink

Where should I look at in these 2 logs to compare what contain the nouveau_bo
buffer between the first st/va being/end frame ? (using demmt -l)

-- 
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.

--1438018260.adf0c8A2.27612
Date: Mon, 27 Jul 2015 17:31:00 +0000
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
   title="NEW - vaDriverInit fails with gallium/nouveau driver"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=89969#c14">Comment # 14</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - vaDriverInit fails with gallium/nouveau driver"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=89969">bug 89969</a>
              from <span class="vcard"><a class="email" href="mailto:julien.isorce&#64;gmail.com" title="Julien Isorce &lt;julien.isorce&#64;gmail.com&gt;"> <span class="fn">Julien Isorce</span></a>
</span></b>
        <pre>Created <span class=""><a href="attachment.cgi?id=117399" name="attach_117399" title="2 valgrind outputs to compare failure case with working reference case">attachment 117399</a> <a href="attachment.cgi?id=117399&amp;action=edit" title="2 valgrind outputs to compare failure case with working reference case">[details]</a></span>
2 valgrind outputs to compare failure case with working reference case

Failure:
LIBVA_DRIVER_NAME=gallium valgrind --tool=mmt --mmt-trace-nouveau-ioctls
--log-file=va_mesa_bin.log gst-launch-1.0 filesrc
location=/home/SERILOCAL/j.isorce/Downloads/centaur_2.mpg num-buffers=6 !
mpegpsdemux ! mpegvideoparse ! vaapideco^C ! tee ! vdieoconvert ! xvimagesink

Success:
LIBVA_DRIVER_NAME=vdpau valgrind --tool=mmt --mmt-trace-nouveau-ioctls
--log-file=va_over_vdpau_mesa_bin.log gst-launch-1.0 filesrc
location=/home/SERILOCAL/j.isorce/Downloads/centaur_2.mpg num-buffers=6 !
mpegpsdemux ! mpegvideoparse ! vaapidecode ! tee ! videoconvert ! xvimagesink

Where should I look at in these 2 logs to compare what contain the nouveau_bo
buffer between the first st/va being/end frame ? (using demmt -l)</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the QA Contact for the bug.</li>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1438018260.adf0c8A2.27612--

--===============1012849944==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1012849944==--
