From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 21273] [NV17] PowerMac3,
 6 Driver can't detect video output and xserver doesn't start
Date: Tue, 28 Jan 2014 20:54:10 +0000
Message-ID: <bug-21273-8800-pdkyyPotNx@http.bugs.freedesktop.org/>
References: <bug-21273-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0466820859=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-21273-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0466820859==
Content-Type: multipart/alternative; boundary="1390942450.bb7458E1.6830"; charset="us-ascii"


--1390942450.bb7458E1.6830
Date: Tue, 28 Jan 2014 20:54:10 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=21273

--- Comment #100 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
(In reply to comment #99)
> Created attachment 92954 [details]
> Strings are realted to nouveau and drm in the kernel log.
> 
> I got kernel 3.13.0. Bug is fixed. I haven't tried kernel without patches
> rather long time. Previously, my monitor suspended and all. But fresh kernel
> have another behavior. I can see ugly console  in the top part of the screen
> and white trash in the bottom part. If it helps, I can attach a screen photo.

Doesn't sound like the bug is fixed... it's just not as bad as before.

[   21.317011] nouveau  [     DRM] allocated 1024x768 fb: 0x9000, bo efa73c00

That means it's not really detecting your monitor, since the resolution should
be higher. Can you try the modification I suggested in comment #98 ? And attach
the logs with the additional debug info from the parameters I mentioned there?

As for the trash that you see -- does it go away if you clear the screen or
otherwise make it so that the console updates that area (e.g. run a command
with a lot of output, etc).

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1390942450.bb7458E1.6830
Date: Tue, 28 Jan 2014 20:54:10 +0000
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
   title="NEW --- - [NV17] PowerMac3,6 Driver can't detect video output and xserver doesn't start"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=21273#c100">Comment # 100</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV17] PowerMac3,6 Driver can't detect video output and xserver doesn't start"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=21273">bug 21273</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=21273#c99">comment #99</a>)
<span class="quote">&gt; Created <span class=""><a href="attachment.cgi?id=92954" name="attach_92954" title="Strings are realted to nouveau and drm in the kernel log.">attachment 92954</a> <a href="attachment.cgi?id=92954&amp;action=edit" title="Strings are realted to nouveau and drm in the kernel log.">[details]</a></span>
&gt; Strings are realted to nouveau and drm in the kernel log.
&gt; 
&gt; I got kernel 3.13.0. Bug is fixed. I haven't tried kernel without patches
&gt; rather long time. Previously, my monitor suspended and all. But fresh kernel
&gt; have another behavior. I can see ugly console  in the top part of the screen
&gt; and white trash in the bottom part. If it helps, I can attach a screen photo.</span >

Doesn't sound like the bug is fixed... it's just not as bad as before.

[   21.317011] nouveau  [     DRM] allocated 1024x768 fb: 0x9000, bo efa73c00

That means it's not really detecting your monitor, since the resolution should
be higher. Can you try the modification I suggested in <a href="show_bug.cgi?id=21273#c98">comment #98</a> ? And attach
the logs with the additional debug info from the parameters I mentioned there?

As for the trash that you see -- does it go away if you clear the screen or
otherwise make it so that the console updates that area (e.g. run a command
with a lot of output, etc).</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1390942450.bb7458E1.6830--

--===============0466820859==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0466820859==--
