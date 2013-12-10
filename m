From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 51477] bad/missing graphics with NV11 / GeForce
	2MX/MX400
Date: Tue, 10 Dec 2013 17:57:50 +0000
Message-ID: <bug-51477-8800-EJbjgRQhwJ@http.bugs.freedesktop.org/>
References: <bug-51477-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1781363349=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-51477-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1781363349==
Content-Type: multipart/alternative; boundary="1386698270.847Ed3.21492"; charset="us-ascii"


--1386698270.847Ed3.21492
Date: Tue, 10 Dec 2013 17:57:50 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=51477

--- Comment #19 from ajhurtado21-/E1597aS9LQAvxtiuMwx3w@public.gmane.org ---
(In reply to comment #17)
> I have an NV17 ( NVIDIA Corporation NV17 [GeForce4 440 Go 64M] (rev a3) )
> and the same problems. 
> 
> Unfortunatly it's a notebook (that would be still fine from my point of
> view) and so i can't change the graphic card.
> 
> I attach some screenshot made with xubuntu 13.10 beta2 with the problems in
> gimp, terminal and the missing icons in thunar.
> 
> Thank you.

I just recently had this same problem with my old desktop with the same
graphics card.

My problem: I'm still a novice in Linux. I started out with Xubutnu 13 awhile
ago, then found out it's not a bug but i support issue. *ubuntu 13 maybe even
12 only supports Xorg server 11 which doesn't support Nvidia driver 96.**. So i
downgraded to Xubuntu 11 which automatically installed my graphics card but
after a couple ppl told me its not a good idea to switch to unsupported OS and
i found out Debian 7 is current and still supports older Nvidia drivers. When i
switch to Debian 7 it doesnt auto install so i had some problems there but
nothing to complex. and for the missing icons and such (which isnt a problem in
Debian 7) just go to Settings> Appearance> Fonts tab uncheck "Enable
Anti-Aliasing and/or Icon tab and switch the icon option.

My Fix: Here's a link to a forum i posted on with the fix
http://www.linuxquestions.org/questions/showthread.php?p=5078340#post5078340

Hopes this helps!

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1386698270.847Ed3.21492
Date: Tue, 10 Dec 2013 17:57:50 +0000
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
   title="NEW --- - bad/missing graphics with NV11 / GeForce 2MX/MX400"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=51477#c19">Comment # 19</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - bad/missing graphics with NV11 / GeForce 2MX/MX400"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=51477">bug 51477</a>
              from <span class="vcard"><a class="email" href="mailto:ajhurtado21&#64;yahoo.com" title="ajhurtado21&#64;yahoo.com">ajhurtado21&#64;yahoo.com</a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=51477#c17">comment #17</a>)
<span class="quote">&gt; I have an NV17 ( NVIDIA Corporation NV17 [GeForce4 440 Go 64M] (rev a3) )
&gt; and the same problems. 
&gt; 
&gt; Unfortunatly it's a notebook (that would be still fine from my point of
&gt; view) and so i can't change the graphic card.
&gt; 
&gt; I attach some screenshot made with xubuntu 13.10 beta2 with the problems in
&gt; gimp, terminal and the missing icons in thunar.
&gt; 
&gt; Thank you.</span >

I just recently had this same problem with my old desktop with the same
graphics card.

My problem: I'm still a novice in Linux. I started out with Xubutnu 13 awhile
ago, then found out it's not a bug but i support issue. *ubuntu 13 maybe even
12 only supports Xorg server 11 which doesn't support Nvidia driver 96.**. So i
downgraded to Xubuntu 11 which automatically installed my graphics card but
after a couple ppl told me its not a good idea to switch to unsupported OS and
i found out Debian 7 is current and still supports older Nvidia drivers. When i
switch to Debian 7 it doesnt auto install so i had some problems there but
nothing to complex. and for the missing icons and such (which isnt a problem in
Debian 7) just go to Settings&gt; Appearance&gt; Fonts tab uncheck &quot;Enable
Anti-Aliasing and/or Icon tab and switch the icon option.

My Fix: Here's a link to a forum i posted on with the fix
<a href="http://www.linuxquestions.org/questions/showthread.php?p=5078340#post5078340">http://www.linuxquestions.org/questions/showthread.php?p=5078340#post5078340</a>

Hopes this helps!</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1386698270.847Ed3.21492--

--===============1781363349==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1781363349==--
