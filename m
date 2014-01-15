From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 60680] [NV96] HDMI is connected and has mode,
 TV says "no signal"
Date: Wed, 15 Jan 2014 17:19:26 +0000
Message-ID: <bug-60680-8800-exZ0aRCdqh@http.bugs.freedesktop.org/>
References: <bug-60680-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0313552661=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-60680-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0313552661==
Content-Type: multipart/alternative; boundary="1389806366.EE73efA2.13048"; charset="us-ascii"


--1389806366.EE73efA2.13048
Date: Wed, 15 Jan 2014 17:19:26 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=60680

--- Comment #17 from Pekka Paalanen <ppaalanen-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Created attachment 92168
  --> https://bugs.freedesktop.org/attachment.cgi?id=92168&action=edit
Kernel log 3.5.2, HDMI clone ok, drm.debug=0xe

As requested, here is the log from a kernel that lights up the HDMI output
properly.

Laptop booted with HDMI connected and TV on, nouveau module then loaded
manually after boot. Fbcon is cloned to both LVDS and HDMI correctly.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1389806366.EE73efA2.13048
Date: Wed, 15 Jan 2014 17:19:26 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=60680#c17">Comment # 17</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV96] HDMI is connected and has mode, TV says &quot;no signal&quot;"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=60680">bug 60680</a>
              from <span class="vcard"><a class="email" href="mailto:ppaalanen&#64;gmail.com" title="Pekka Paalanen &lt;ppaalanen&#64;gmail.com&gt;"> <span class="fn">Pekka Paalanen</span></a>
</span></b>
        <pre>Created <span class=""><a href="attachment.cgi?id=92168" name="attach_92168" title="Kernel log 3.5.2, HDMI clone ok, drm.debug=0xe">attachment 92168</a> <a href="attachment.cgi?id=92168&amp;action=edit" title="Kernel log 3.5.2, HDMI clone ok, drm.debug=0xe">[details]</a></span>
Kernel log 3.5.2, HDMI clone ok, drm.debug=0xe

As requested, here is the log from a kernel that lights up the HDMI output
properly.

Laptop booted with HDMI connected and TV on, nouveau module then loaded
manually after boot. Fbcon is cloned to both LVDS and HDMI correctly.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1389806366.EE73efA2.13048--

--===============0313552661==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0313552661==--
