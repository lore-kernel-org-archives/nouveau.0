From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 61731] Nouveau not working on second monitor
Date: Sun, 03 Mar 2013 11:50:45 +0000
Message-ID: <bug-61731-8800-ZGSfw6sWrQ@http.bugs.freedesktop.org/>
References: <bug-61731-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1288184136=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-61731-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1288184136==
Content-Type: multipart/alternative; boundary="1362311445.2CFeF2.12356"; charset="us-ascii"


--1362311445.2CFeF2.12356
Date: Sun, 3 Mar 2013 11:50:45 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=61731

--- Comment #4 from Roy <r.spliet-oe7qfRrRQfeEZXFvZSAUrfP6llvjuJOh@public.gmane.org> ---
(In reply to comment #3)
> :-) You might have saved my live: after blacklisting these modules:
> 
> blacklist vga16fb
> #blacklist nouveau
> #blacklist nouveau_drv
> blacklist rivafb
> blacklist nvidiafb
> blacklist rivatv
> blacklist nvidia
> 
> my laptop magicaly boots correct, even WITH the powercord plugged which has
> not happened to me in over 2 years!
> 
> I will test this this week and come back any way to report whether this is
> solved.
> 
> Thank you very much!

Good to hear everything works fine now. If you wish to continue using the
nouveau driver please ensure that you remove (uninstall) nVidias driver and
(re-) install mesa-libGL. This latter step will enable 3D acceleration with
nouveau.
If you need more specific instructions on this I would advice you to inquire
with your distribution ``makers'', as this differs from distro to distro.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1362311445.2CFeF2.12356
Date: Sun, 3 Mar 2013 11:50:45 +0000
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
   title="NEW --- - Nouveau not working on second monitor"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=61731#c4">Comment # 4</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - Nouveau not working on second monitor"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=61731">bug 61731</a>
              from <span class="vcard"><a class="email" href="mailto:r.spliet&#64;student.tudelft.nl" title="Roy &lt;r.spliet&#64;student.tudelft.nl&gt;"> <span class="fn">Roy</span></a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=61731#c3">comment #3</a>)
<span class="quote">&gt; :-) You might have saved my live: after blacklisting these modules:
&gt; 
&gt; blacklist vga16fb
&gt; #blacklist nouveau
&gt; #blacklist nouveau_drv
&gt; blacklist rivafb
&gt; blacklist nvidiafb
&gt; blacklist rivatv
&gt; blacklist nvidia
&gt; 
&gt; my laptop magicaly boots correct, even WITH the powercord plugged which has
&gt; not happened to me in over 2 years!
&gt; 
&gt; I will test this this week and come back any way to report whether this is
&gt; solved.
&gt; 
&gt; Thank you very much!</span >

Good to hear everything works fine now. If you wish to continue using the
nouveau driver please ensure that you remove (uninstall) nVidias driver and
(re-) install mesa-libGL. This latter step will enable 3D acceleration with
nouveau.
If you need more specific instructions on this I would advice you to inquire
with your distribution ``makers'', as this differs from distro to distro.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1362311445.2CFeF2.12356--

--===============1288184136==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1288184136==--
