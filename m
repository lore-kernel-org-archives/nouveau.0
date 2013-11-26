From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 70875] [NVC1] NOUVEAU(0): [drm] failed to set drm
 interface version
Date: Tue, 26 Nov 2013 10:07:07 +0000
Message-ID: <bug-70875-8800-NIVvhyaZ8U@http.bugs.freedesktop.org/>
References: <bug-70875-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0451232766=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-70875-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0451232766==
Content-Type: multipart/alternative; boundary="1385460427.De4fF871.20237"; charset="us-ascii"


--1385460427.De4fF871.20237
Date: Tue, 26 Nov 2013 10:07:07 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=70875

--- Comment #9 from Marcin Zajaczkowski <mszpak-5tc4TXWwyLM@public.gmane.org> ---
(In reply to comment #8)
> I don't see anything that suggests that you have a hardware mux. The VGA/DVI
> connectors appear to be on the nvidia card -- they're inaccessible from
> intel, right? (A bit hard to tell from your logs...)

Hmm, I thought I have one (or maybe I don't understand a problem :) ).
Currently with bumblebee I have NVidia card off and still can use both screen
(though VGA or HDMI output).

$ cat /proc/acpi/bbswitch
0000:01:00.0 OFF
$ lsmod | grep nouveau
$ lsmod | grep nv

> So... please try the following:
> 
> linux 3.13-rc1 -- this has some fixes for nvc1 as well as runtime pm.

Ok, I will try to get this kernel and let you know.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1385460427.De4fF871.20237
Date: Tue, 26 Nov 2013 10:07:07 +0000
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
   title="NEW --- - [NVC1] NOUVEAU(0): [drm] failed to set drm interface version"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=70875#c9">Comment # 9</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVC1] NOUVEAU(0): [drm] failed to set drm interface version"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=70875">bug 70875</a>
              from <span class="vcard"><a class="email" href="mailto:mszpak&#64;wp.pl" title="Marcin Zajaczkowski &lt;mszpak&#64;wp.pl&gt;"> <span class="fn">Marcin Zajaczkowski</span></a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=70875#c8">comment #8</a>)
<span class="quote">&gt; I don't see anything that suggests that you have a hardware mux. The VGA/DVI
&gt; connectors appear to be on the nvidia card -- they're inaccessible from
&gt; intel, right? (A bit hard to tell from your logs...)</span >

Hmm, I thought I have one (or maybe I don't understand a problem :) ).
Currently with bumblebee I have NVidia card off and still can use both screen
(though VGA or HDMI output).

$ cat /proc/acpi/bbswitch
0000:01:00.0 OFF
$ lsmod | grep nouveau
$ lsmod | grep nv

<span class="quote">&gt; So... please try the following:
&gt; 
&gt; linux 3.13-rc1 -- this has some fixes for nvc1 as well as runtime pm.</span >

Ok, I will try to get this kernel and let you know.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1385460427.De4fF871.20237--

--===============0451232766==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0451232766==--
