From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 55450] [NV17] nouveau driver fails to restore screen
 content / video mode after resume from s2ram
Date: Wed, 16 Oct 2013 18:21:33 +0000
Message-ID: <bug-55450-8800-0yy84Yu7Vr@http.bugs.freedesktop.org/>
References: <bug-55450-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0361530188=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-55450-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0361530188==
Content-Type: multipart/alternative; boundary="1381947693.cbB6Bc462.18264"; charset="us-ascii"


--1381947693.cbB6Bc462.18264
Date: Wed, 16 Oct 2013 18:21:33 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=55450

--- Comment #12 from Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
(In reply to comment #11)
> In deed, it is now a kernel issue (... and I doubt that it previously was)!
> I have tried to s2ram from init=/bin/bash with mount -t sysfs none /sys:
Not sure if you need anything as fancy as this

Appending " 3" to your kernel command line (grub, lilo or whichever you use)
should default to runlevel 3, thus no X would ever be attempted.

> * s2ram -nofbsuspend
Not sure I've seen this option. Then again not sure that I've seem this program
either. 

From http://old-en.opensuse.org/S2ram
> ... s2ram is deprecated ...Instead, use a kernel with KMS drivers where suspend should just work

Please try a plain pm-suspend or even 
$ echo mem > /sys/power/state

>   result: bluescreen; sysrq-keys are not working
> * nouveau.modeset=0; s2ram
>   result: text console is restored and almost readable; however sysrq-keys
> are still not working.
> 
This is "amazing" :)
Can you blacklist nouveau and see if sysrq-keys will work after s2r ? If it
does not there is nothing we can do :'(

> kernel-3.11.3-1.1-default
> 
> (I would wonder if you still needed libdrm, Mesa version by now; there will
> be no pm-suspend dmesg on init=/bin/bash). Should I re-post on kernel.org?
Your initial report did not indicate if the issue happens without X -> the
request for libdrm... etc

If plain VT is not working, we should start from there. See the above
suggestions.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1381947693.cbB6Bc462.18264
Date: Wed, 16 Oct 2013 18:21:33 +0000
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
          bz_status_REOPENED "
   title="REOPENED --- - [NV17] nouveau driver fails to restore screen content / video mode after resume from s2ram"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=55450#c12">Comment # 12</a>
              on <a class="bz_bug_link 
          bz_status_REOPENED "
   title="REOPENED --- - [NV17] nouveau driver fails to restore screen content / video mode after resume from s2ram"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=55450">bug 55450</a>
              from <span class="vcard"><a class="email" href="mailto:emil.l.velikov&#64;gmail.com" title="Emil Velikov &lt;emil.l.velikov&#64;gmail.com&gt;"> <span class="fn">Emil Velikov</span></a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=55450#c11">comment #11</a>)
<span class="quote">&gt; In deed, it is now a kernel issue (... and I doubt that it previously was)!
&gt; I have tried to s2ram from init=/bin/bash with mount -t sysfs none /sys:</span >
Not sure if you need anything as fancy as this

Appending &quot; 3&quot; to your kernel command line (grub, lilo or whichever you use)
should default to runlevel 3, thus no X would ever be attempted.

<span class="quote">&gt; * s2ram -nofbsuspend</span >
Not sure I've seen this option. Then again not sure that I've seem this program
either. 

From <a href="http://old-en.opensuse.org/S2ram">http://old-en.opensuse.org/S2ram</a>
<span class="quote">&gt; ... s2ram is deprecated ...Instead, use a kernel with KMS drivers where suspend should just work</span >

Please try a plain pm-suspend or even 
$ echo mem &gt; /sys/power/state

<span class="quote">&gt;   result: bluescreen; sysrq-keys are not working
&gt; * nouveau.modeset=0; s2ram
&gt;   result: text console is restored and almost readable; however sysrq-keys
&gt; are still not working.
&gt; </span >
This is &quot;amazing&quot; :)
Can you blacklist nouveau and see if sysrq-keys will work after s2r ? If it
does not there is nothing we can do :'(

<span class="quote">&gt; kernel-3.11.3-1.1-default
&gt; 
&gt; (I would wonder if you still needed libdrm, Mesa version by now; there will
&gt; be no pm-suspend dmesg on init=/bin/bash). Should I re-post on kernel.org?</span >
Your initial report did not indicate if the issue happens without X -&gt; the
request for libdrm... etc

If plain VT is not working, we should start from there. See the above
suggestions.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1381947693.cbB6Bc462.18264--

--===============0361530188==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0361530188==--
