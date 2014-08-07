From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 82255] [VP2] Chroma planes are vertically stretched
 during VDPAU playback
Date: Thu, 07 Aug 2014 10:40:17 +0000
Message-ID: <bug-82255-8800-T3dKyZbyjG@http.bugs.freedesktop.org/>
References: <bug-82255-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1397278854=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-82255-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1397278854==
Content-Type: multipart/alternative; boundary="1407408016.DdFC0.30062"; charset="us-ascii"


--1407408016.DdFC0.30062
Date: Thu, 7 Aug 2014 10:40:16 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=82255

--- Comment #4 from Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
A couple of interesting bits:

The surface produced by the vdpau state-tracker is exactly the same one
displayed on the screen - there seems to be no nv12 <> yv12 screw-up in VLC.
On the other hand the vlVdpCopyNV12ToYV12 function, converts the original data,
based on the assumption that both fields are interleaved while it seems that
they are both continuous one after the other. The other two conversion
functions follow the same field 0 and 1 (top+bottom ?) are interleaved.

All of them are added with commit e6c2afa9ceacc188690deba9da7b46bf1a0a9027
(st/vdpau: add format conversions for GetBitsYCbCr) with VLC in mind :)

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1407408016.DdFC0.30062
Date: Thu, 7 Aug 2014 10:40:16 +0000
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
   title="NEW --- - [VP2] Chroma planes are vertically stretched during VDPAU playback"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=82255#c4">Comment # 4</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [VP2] Chroma planes are vertically stretched during VDPAU playback"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=82255">bug 82255</a>
              from <span class="vcard"><a class="email" href="mailto:emil.l.velikov&#64;gmail.com" title="Emil Velikov &lt;emil.l.velikov&#64;gmail.com&gt;"> <span class="fn">Emil Velikov</span></a>
</span></b>
        <pre>A couple of interesting bits:

The surface produced by the vdpau state-tracker is exactly the same one
displayed on the screen - there seems to be no nv12 &lt;&gt; yv12 screw-up in VLC.
On the other hand the vlVdpCopyNV12ToYV12 function, converts the original data,
based on the assumption that both fields are interleaved while it seems that
they are both continuous one after the other. The other two conversion
functions follow the same field 0 and 1 (top+bottom ?) are interleaved.

All of them are added with commit e6c2afa9ceacc188690deba9da7b46bf1a0a9027
(st/vdpau: add format conversions for GetBitsYCbCr) with VLC in mind :)</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1407408016.DdFC0.30062--

--===============1397278854==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1397278854==--
