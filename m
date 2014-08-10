From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 82255] [VP2] Chroma planes are vertically stretched
 during VDPAU playback
Date: Sun, 10 Aug 2014 17:58:04 +0000
Message-ID: <bug-82255-8800-5Lng3ASaWh@http.bugs.freedesktop.org/>
References: <bug-82255-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1772828609=="
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


--===============1772828609==
Content-Type: multipart/alternative; boundary="1407693484.4dEC3D0.5188"; charset="us-ascii"


--1407693484.4dEC3D0.5188
Date: Sun, 10 Aug 2014 17:58:04 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=82255

--- Comment #9 from Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
As requested by Ilia, the above four are the raw data (unaltered by the ST ?)
gathered from vlVdpVideoSurfaceGetBitsYCbCr(), prior to the colorspace
conversion.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1407693484.4dEC3D0.5188
Date: Sun, 10 Aug 2014 17:58:04 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=82255#c9">Comment # 9</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [VP2] Chroma planes are vertically stretched during VDPAU playback"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=82255">bug 82255</a>
              from <span class="vcard"><a class="email" href="mailto:emil.l.velikov&#64;gmail.com" title="Emil Velikov &lt;emil.l.velikov&#64;gmail.com&gt;"> <span class="fn">Emil Velikov</span></a>
</span></b>
        <pre>As requested by Ilia, the above four are the raw data (unaltered by the ST ?)
gathered from vlVdpVideoSurfaceGetBitsYCbCr(), prior to the colorspace
conversion.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1407693484.4dEC3D0.5188--

--===============1772828609==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1772828609==--
