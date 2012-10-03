From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 46557] nouveau: NV4E acceleration corruption when
 DMA above 31-bit (2 Gig barrier)
Date: Wed, 03 Oct 2012 07:47:46 +0000
Message-ID: <bug-46557-8800-1UhwLXZzVx@http.bugs.freedesktop.org/>
References: <bug-46557-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0917450915=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-46557-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0917450915==
Content-Type: multipart/alternative; boundary="1349250467.B1BcA3.25360"; charset="us-ascii"


--1349250467.B1BcA3.25360
Date: Wed, 3 Oct 2012 07:47:47 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=46557

--- Comment #21 from Salah Coronya <salah.coronya-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Created attachment 68024
  --> https://bugs.freedesktop.org/attachment.cgi?id=68024&action=edit
dmesg of new kernel

It runs FAR better - the distortion and lockups are gone, and the picture us
substantially better (on par with the blob).

Its not quite 100% - X crashes reliably if I switch to another VT, back to X,
and then use something with video acceleration (after it crashes and restart
its distored like before, but not locked up. If I apply the workaround in bug
31961, X still crashes but restarts withotu distortion)

Regardless of console switching, CACHE_ERROR start flooding the syslog but not
immedately, but there no noticable artfacts or slowdown.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1349250467.B1BcA3.25360
Date: Wed, 3 Oct 2012 07:47:47 +0000
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
   title="NEW --- - nouveau: NV4E acceleration corruption when DMA above 31-bit (2 Gig barrier)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=46557#c21">Comment # 21</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - nouveau: NV4E acceleration corruption when DMA above 31-bit (2 Gig barrier)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=46557">bug 46557</a>
              from <span class="vcard"><a class="email" href="mailto:salah.coronya&#64;gmail.com" title="Salah Coronya &lt;salah.coronya&#64;gmail.com&gt;"> <span class="fn">Salah Coronya</span></a>
</span></b>
        <pre>Created <span class=""><a href="attachment.cgi?id=68024" name="attach_68024" title="dmesg of new kernel">attachment 68024</a> <a href="attachment.cgi?id=68024&amp;action=edit" title="dmesg of new kernel">[details]</a></span>
dmesg of new kernel

It runs FAR better - the distortion and lockups are gone, and the picture us
substantially better (on par with the blob).

Its not quite 100% - X crashes reliably if I switch to another VT, back to X,
and then use something with video acceleration (after it crashes and restart
its distored like before, but not locked up. If I apply the workaround in <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [drm:drm_crtc_helper_set_config] *ERROR* failed to set mode on [CRTC:6]"
   href="show_bug.cgi?id=31961">bug
31961</a>, X still crashes but restarts withotu distortion)

Regardless of console switching, CACHE_ERROR start flooding the syslog but not
immedately, but there no noticable artfacts or slowdown.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1349250467.B1BcA3.25360--

--===============0917450915==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0917450915==--
