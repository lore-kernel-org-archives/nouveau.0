From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 67382] [nouveau,
 nv50] linux 3.9.7-3.10.3: Xorg won't be available
Date: Thu, 01 Aug 2013 17:43:23 +0000
Message-ID: <bug-67382-8800-6QzjjWwKg8@http.bugs.freedesktop.org/>
References: <bug-67382-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0440659869=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-67382-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0440659869==
Content-Type: multipart/alternative; boundary="1375379003.b72bFf252.4058"; charset="us-ascii"


--1375379003.b72bFf252.4058
Date: Thu, 1 Aug 2013 17:43:23 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=67382

--- Comment #21 from Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
(In reply to comment #20)
> It was working. Xorg.log wrote, that DVI-I-1 is disconnected and DVI-I-2
> connected.
Let me see if I'm not day dreaming in here. If you startup with your monitor
connected to the second DVI port, everything works fine ?

> The resulting dmesg varies at following lines from the first:
> [   11.804787] nouveau  [   PDISP][0000:01:00.0] nv50_dac_mthd power(or 2,
> data[0] 0x000001a4) 0x00000000
> [   11.806777] nouveau  [   PDISP][0000:01:00.0] nv50_dac_mthd power(or 2,
> data[0] 0x000001a4) 0x00000000
> [   11.837181] nouveau  [   PDISP][0000:01:00.0] nv50_dac_mthd power(or 2,
> data[0] 0x000001a4) 0x00000000
> [   11.839164] nouveau  [   PDISP][0000:01:00.0] nv50_dac_mthd power(or 2,
> data[0] 0x000001a4) 0x00000000
> 
I'm suspecting that there was a bit more to differ than this - such as the "or"
on the other two printf's should differ as well. Would you mind attaching the
dmesg ?

Thanks

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1375379003.b72bFf252.4058
Date: Thu, 1 Aug 2013 17:43:23 +0000
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
   title="NEW --- - [nouveau, nv50] linux 3.9.7-3.10.3: Xorg won't be available"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=67382#c21">Comment # 21</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [nouveau, nv50] linux 3.9.7-3.10.3: Xorg won't be available"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=67382">bug 67382</a>
              from <span class="vcard"><a class="email" href="mailto:emil.l.velikov&#64;gmail.com" title="Emil Velikov &lt;emil.l.velikov&#64;gmail.com&gt;"> <span class="fn">Emil Velikov</span></a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=67382#c20">comment #20</a>)
<span class="quote">&gt; It was working. Xorg.log wrote, that DVI-I-1 is disconnected and DVI-I-2
&gt; connected.</span >
Let me see if I'm not day dreaming in here. If you startup with your monitor
connected to the second DVI port, everything works fine ?

<span class="quote">&gt; The resulting dmesg varies at following lines from the first:
&gt; [   11.804787] nouveau  [   PDISP][0000:01:00.0] nv50_dac_mthd power(or 2,
&gt; data[0] 0x000001a4) 0x00000000
&gt; [   11.806777] nouveau  [   PDISP][0000:01:00.0] nv50_dac_mthd power(or 2,
&gt; data[0] 0x000001a4) 0x00000000
&gt; [   11.837181] nouveau  [   PDISP][0000:01:00.0] nv50_dac_mthd power(or 2,
&gt; data[0] 0x000001a4) 0x00000000
&gt; [   11.839164] nouveau  [   PDISP][0000:01:00.0] nv50_dac_mthd power(or 2,
&gt; data[0] 0x000001a4) 0x00000000
&gt; </span >
I'm suspecting that there was a bit more to differ than this - such as the &quot;or&quot;
on the other two printf's should differ as well. Would you mind attaching the
dmesg ?

Thanks</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1375379003.b72bFf252.4058--

--===============0440659869==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0440659869==--
