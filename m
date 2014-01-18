From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 73770] nouveau doesn't setup 1920x1200 mode on HDMI
	properly
Date: Sat, 18 Jan 2014 19:09:37 +0000
Message-ID: <bug-73770-8800-9fY3MZLwFk@http.bugs.freedesktop.org/>
References: <bug-73770-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1335651835=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-73770-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1335651835==
Content-Type: multipart/alternative; boundary="1390072177.cd781.15614"; charset="us-ascii"


--1390072177.cd781.15614
Date: Sat, 18 Jan 2014 19:09:37 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=73770

--- Comment #2 from Martin Holec <martix.cz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Created attachment 92352
  --> https://bugs.freedesktop.org/attachment.cgi?id=92352&action=edit
dmesg video=DP-1:1920x1200

I cannot workaround it by adding this to kernel cmdline: video=DP-1:1920x1200
nor using xorg.conf "Modeline" and "PreferedMode" options.

At least DRM allocates "1920x1200" instead of "1920x1080", but I don't any
other change from actual results.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1390072177.cd781.15614
Date: Sat, 18 Jan 2014 19:09:37 +0000
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
   title="NEW --- - nouveau doesn't setup 1920x1200 mode on HDMI properly"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=73770#c2">Comment # 2</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - nouveau doesn't setup 1920x1200 mode on HDMI properly"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=73770">bug 73770</a>
              from <span class="vcard"><a class="email" href="mailto:martix.cz&#64;gmail.com" title="Martin Holec &lt;martix.cz&#64;gmail.com&gt;"> <span class="fn">Martin Holec</span></a>
</span></b>
        <pre>Created <span class=""><a href="attachment.cgi?id=92352" name="attach_92352" title="dmesg video=DP-1:1920x1200">attachment 92352</a> <a href="attachment.cgi?id=92352&amp;action=edit" title="dmesg video=DP-1:1920x1200">[details]</a></span>
dmesg video=DP-1:1920x1200

I cannot workaround it by adding this to kernel cmdline: video=DP-1:1920x1200
nor using xorg.conf &quot;Modeline&quot; and &quot;PreferedMode&quot; options.

At least DRM allocates &quot;1920x1200&quot; instead of &quot;1920x1080&quot;, but I don't any
other change from actual results.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1390072177.cd781.15614--

--===============1335651835==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1335651835==--
