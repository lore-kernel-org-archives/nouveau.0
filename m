From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 69203] [NVC1] Kernel 3.11 - Xorg hangs immediately
 after invocation
Date: Fri, 01 Nov 2013 17:36:32 +0000
Message-ID: <bug-69203-8800-Ty3NZu5CSp@http.bugs.freedesktop.org/>
References: <bug-69203-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0322479043=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-69203-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0322479043==
Content-Type: multipart/alternative; boundary="1383327392.44c3a3.9479"; charset="us-ascii"


--1383327392.44c3a3.9479
Date: Fri, 1 Nov 2013 17:36:32 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=69203

--- Comment #17 from Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
(In reply to comment #16)
> i don't really know how to apply this patch to my current kernel, if i need
> to recompile or anything else

I do not think that applying/reverting the patch on top of current kernel is
possible.
Here is an example "how to"

1. Clone the git tree 
$ git clone git://anongit.freedesktop.org/nouveau/linux-2.6

2. Checkout at good/working commit 
$ git checkout -B fdo69203.good 30f4e0870d1726f31aa59804337cfd5e0a3f2e~1
3. Rebuild the kernel and install
4. MMIO trace it

5. Checkout the first bad/non-working commit 
$ git checkout -B fdo69203.good 30f4e0870d1726f31aa59804337cfd5e0a3f2e
6. Rebuild the kernel and install
7. MMIO trace it

8. Email the dumps to mmio dot trace at gmail dot com
9. [Optional] Diff the traces and attach the output :)

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1383327392.44c3a3.9479
Date: Fri, 1 Nov 2013 17:36:32 +0000
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
   title="NEW --- - [NVC1] Kernel 3.11 - Xorg hangs immediately after invocation"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=69203#c17">Comment # 17</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVC1] Kernel 3.11 - Xorg hangs immediately after invocation"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=69203">bug 69203</a>
              from <span class="vcard"><a class="email" href="mailto:emil.l.velikov&#64;gmail.com" title="Emil Velikov &lt;emil.l.velikov&#64;gmail.com&gt;"> <span class="fn">Emil Velikov</span></a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=69203#c16">comment #16</a>)
<span class="quote">&gt; i don't really know how to apply this patch to my current kernel, if i need
&gt; to recompile or anything else</span >

I do not think that applying/reverting the patch on top of current kernel is
possible.
Here is an example &quot;how to&quot;

1. Clone the git tree 
$ git clone git://anongit.freedesktop.org/nouveau/linux-2.6

2. Checkout at good/working commit 
$ git checkout -B fdo69203.good 30f4e0870d1726f31aa59804337cfd5e0a3f2e~1
3. Rebuild the kernel and install
4. MMIO trace it

5. Checkout the first bad/non-working commit 
$ git checkout -B fdo69203.good 30f4e0870d1726f31aa59804337cfd5e0a3f2e
6. Rebuild the kernel and install
7. MMIO trace it

8. Email the dumps to mmio dot trace at gmail dot com
9. [Optional] Diff the traces and attach the output :)</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1383327392.44c3a3.9479--

--===============0322479043==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0322479043==--
