From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 60680] [NV96] HDMI is connected and has mode,
 TV says "no signal"
Date: Sat, 18 Jan 2014 08:38:11 +0000
Message-ID: <bug-60680-8800-FP3eNqNsSh@http.bugs.freedesktop.org/>
References: <bug-60680-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1078903735=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-60680-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1078903735==
Content-Type: multipart/alternative; boundary="1390034291.c5D1D5522.9865"; charset="us-ascii"


--1390034291.c5D1D5522.9865
Date: Sat, 18 Jan 2014 08:38:11 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=60680

--- Comment #20 from Pekka Paalanen <ppaalanen-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Created attachment 92319
  --> https://bugs.freedesktop.org/attachment.cgi?id=92319&action=edit
kernel 3.12.6 with vbios-pq1.patch log

Here is the kernel log with the nouveau debug options Ilia asked, with the
vbios-pq1.patch applied. I booted with HDMI connected to the live TV, and I
manually loaded nouveau.ko after boot.

I'm happy to say that this change makes fbcon appear on the TV!

This also makes X show up on TV, and I can use xrandr to set the TV to full-HD
resolution, extending my desktop from LVDS. So they both came up fine this time
(I've had vague problems with using both outputs non-cloned before).

Wheee! \o/

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1390034291.c5D1D5522.9865
Date: Sat, 18 Jan 2014 08:38:11 +0000
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
   title="NEW --- - [NV96] HDMI is connected and has mode, TV says &quot;no signal&quot;"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=60680#c20">Comment # 20</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV96] HDMI is connected and has mode, TV says &quot;no signal&quot;"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=60680">bug 60680</a>
              from <span class="vcard"><a class="email" href="mailto:ppaalanen&#64;gmail.com" title="Pekka Paalanen &lt;ppaalanen&#64;gmail.com&gt;"> <span class="fn">Pekka Paalanen</span></a>
</span></b>
        <pre>Created <span class=""><a href="attachment.cgi?id=92319" name="attach_92319" title="kernel 3.12.6 with vbios-pq1.patch log">attachment 92319</a> <a href="attachment.cgi?id=92319&amp;action=edit" title="kernel 3.12.6 with vbios-pq1.patch log">[details]</a></span>
kernel 3.12.6 with vbios-pq1.patch log

Here is the kernel log with the nouveau debug options Ilia asked, with the
vbios-pq1.patch applied. I booted with HDMI connected to the live TV, and I
manually loaded nouveau.ko after boot.

I'm happy to say that this change makes fbcon appear on the TV!

This also makes X show up on TV, and I can use xrandr to set the TV to full-HD
resolution, extending my desktop from LVDS. So they both came up fine this time
(I've had vague problems with using both outputs non-cloned before).

Wheee! \o/</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1390034291.c5D1D5522.9865--

--===============1078903735==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1078903735==--
