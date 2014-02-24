From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 75447] [NVA0] Secondary gpu is not enabled if
 nouveau is loaded from initrd/initramfs
Date: Mon, 24 Feb 2014 16:29:37 +0000
Message-ID: <bug-75447-8800-CYYeIFRqEw@http.bugs.freedesktop.org/>
References: <bug-75447-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0428726829=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-75447-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0428726829==
Content-Type: multipart/alternative; boundary="1393259377.3AbedE1.10849"; charset="us-ascii"


--1393259377.3AbedE1.10849
Date: Mon, 24 Feb 2014 16:29:37 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=75447

--- Comment #8 from Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
(In reply to comment #7)
> Hi Emil
> 
> I've attached two new dmesg from the same 3.13 kernel. Note that nouveau is
> always built as a module, what causes the problem is having it embedded into
> the initramfs
> 
> Thanks
Ouch thanks for point it out. Seems like I was day dreaming there.

Afaics there are only differences between the two
 - In the "good" case, nouveau manages to load the adt7473 i2c sensor. Not
related to your problem, but might indicate why you do not see the temperature
reading in "sensors"
 - The runtime pm tries to suspend one of the cards (assuming the latter) where
it should not have. Most likely the real problem, disable using
"nouveau.runpm=0" in your kernel command line (i.e grub)

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1393259377.3AbedE1.10849
Date: Mon, 24 Feb 2014 16:29:37 +0000
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
   title="NEW --- - [NVA0] Secondary gpu is not enabled if nouveau is loaded from initrd/initramfs"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=75447#c8">Comment # 8</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVA0] Secondary gpu is not enabled if nouveau is loaded from initrd/initramfs"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=75447">bug 75447</a>
              from <span class="vcard"><a class="email" href="mailto:emil.l.velikov&#64;gmail.com" title="Emil Velikov &lt;emil.l.velikov&#64;gmail.com&gt;"> <span class="fn">Emil Velikov</span></a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=75447#c7">comment #7</a>)
<span class="quote">&gt; Hi Emil
&gt; 
&gt; I've attached two new dmesg from the same 3.13 kernel. Note that nouveau is
&gt; always built as a module, what causes the problem is having it embedded into
&gt; the initramfs
&gt; 
&gt; Thanks</span >
Ouch thanks for point it out. Seems like I was day dreaming there.

Afaics there are only differences between the two
 - In the &quot;good&quot; case, nouveau manages to load the adt7473 i2c sensor. Not
related to your problem, but might indicate why you do not see the temperature
reading in &quot;sensors&quot;
 - The runtime pm tries to suspend one of the cards (assuming the latter) where
it should not have. Most likely the real problem, disable using
&quot;nouveau.runpm=0&quot; in your kernel command line (i.e grub)</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1393259377.3AbedE1.10849--

--===============0428726829==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0428726829==--
