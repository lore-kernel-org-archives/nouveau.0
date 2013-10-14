From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 69928] [NVAA] Boot of linux kernel 3.12-rc2 hangs
Date: Mon, 14 Oct 2013 23:25:46 +0000
Message-ID: <bug-69928-8800-ukUI5w3edr@http.bugs.freedesktop.org/>
References: <bug-69928-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1277470949=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-69928-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1277470949==
Content-Type: multipart/alternative; boundary="1381793146.3E7cDa2.17777"; charset="us-ascii"


--1381793146.3E7cDa2.17777
Date: Mon, 14 Oct 2013 23:25:46 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=69928

--- Comment #6 from Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
(In reply to comment #5)
> Confirmed with 3.12-rc4. 
> 
> System:
>  ASUS P6T SE, i7
>  Nvidia GF100 [GeForce GTX 470] (rev a3).
>  Ubuntu 13.04.
> 
> Details: No error with 3.10 kernel.   Boots / hangs in the text mode before
> unity-greater with 3.12-rc4.     Boots succesfully / works fine with
> 3.12-rc4 with nouveau.config=NvMSI=0 in the boot command line.
> 
> 
> I would suggest rising a priority on this one.

MSI will be disabled by default for 3.12 as a result of this and a few other
related regressions.

To help fix this in the future, would you be able to get me a trace of the
nvidia binary driver?

Instructions of how to do so are here:
http://nouveau.freedesktop.org/wiki/MmioTrace/

Thanks!

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1381793146.3E7cDa2.17777
Date: Mon, 14 Oct 2013 23:25:46 +0000
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
   title="NEW --- - [NVAA] Boot of linux kernel 3.12-rc2 hangs"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=69928#c6">Comment # 6</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVAA] Boot of linux kernel 3.12-rc2 hangs"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=69928">bug 69928</a>
              from <span class="vcard"><a class="email" href="mailto:skeggsb&#64;gmail.com" title="Ben Skeggs &lt;skeggsb&#64;gmail.com&gt;"> <span class="fn">Ben Skeggs</span></a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=69928#c5">comment #5</a>)
<span class="quote">&gt; Confirmed with 3.12-rc4. 
&gt; 
&gt; System:
&gt;  ASUS P6T SE, i7
&gt;  Nvidia GF100 [GeForce GTX 470] (rev a3).
&gt;  Ubuntu 13.04.
&gt; 
&gt; Details: No error with 3.10 kernel.   Boots / hangs in the text mode before
&gt; unity-greater with 3.12-rc4.     Boots succesfully / works fine with
&gt; 3.12-rc4 with nouveau.config=NvMSI=0 in the boot command line.
&gt; 
&gt; 
&gt; I would suggest rising a priority on this one.</span >

MSI will be disabled by default for 3.12 as a result of this and a few other
related regressions.

To help fix this in the future, would you be able to get me a trace of the
nvidia binary driver?

Instructions of how to do so are here:
<a href="http://nouveau.freedesktop.org/wiki/MmioTrace/">http://nouveau.freedesktop.org/wiki/MmioTrace/</a>

Thanks!</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1381793146.3E7cDa2.17777--

--===============1277470949==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1277470949==--
