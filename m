From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 67382] [nouveau,
 nv50] linux 3.9.7-3.10.3: Xorg won't be available
Date: Wed, 31 Jul 2013 23:34:40 +0000
Message-ID: <bug-67382-8800-13ZFbqOGrA@http.bugs.freedesktop.org/>
References: <bug-67382-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0265057203=="
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


--===============0265057203==
Content-Type: multipart/alternative; boundary="1375313680.43D5102.23101"; charset="us-ascii"


--1375313680.43D5102.23101
Date: Wed, 31 Jul 2013 23:34:40 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=67382

--- Comment #19 from Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
According to your vbios
> dvi-1 --> dvi-to-vga adaptor going to a vga monitor
The above uses OR 2/1 for analogue/digital output

> dvi-2 --> normally not used. But working
OR 1/1 respectively here

> tv-out --> never tested
OR 0


Can you redo my request from comment 15, but with the monitor connected into
the other dvi port

Just for the jokes can you try booting a failing kernel with
nouveau.tv_disable=1 appended to your command line.


If the above fails would be great if you can grab and compile a couple of
kernels
* git checkout 7ebb38b556485449bfaa506a196439f6a6fd6ebd~1

and
* git checkout 7ebb38b556485449bfaa506a196439f6a6fd6ebd~2

Obviously let me know how they fare and attach the output of dmesg for both

Thanks
Emil

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1375313680.43D5102.23101
Date: Wed, 31 Jul 2013 23:34:40 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=67382#c19">Comment # 19</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [nouveau, nv50] linux 3.9.7-3.10.3: Xorg won't be available"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=67382">bug 67382</a>
              from <span class="vcard"><a class="email" href="mailto:emil.l.velikov&#64;gmail.com" title="Emil Velikov &lt;emil.l.velikov&#64;gmail.com&gt;"> <span class="fn">Emil Velikov</span></a>
</span></b>
        <pre>According to your vbios
<span class="quote">&gt; dvi-1 --&gt; dvi-to-vga adaptor going to a vga monitor</span >
The above uses OR 2/1 for analogue/digital output

<span class="quote">&gt; dvi-2 --&gt; normally not used. But working</span >
OR 1/1 respectively here

<span class="quote">&gt; tv-out --&gt; never tested</span >
OR 0


Can you redo my request from <a href="show_bug.cgi?id=67382#c15">comment 15</a>, but with the monitor connected into
the other dvi port

Just for the jokes can you try booting a failing kernel with
nouveau.tv_disable=1 appended to your command line.


If the above fails would be great if you can grab and compile a couple of
kernels
* git checkout 7ebb38b556485449bfaa506a196439f6a6fd6ebd~1

and
* git checkout 7ebb38b556485449bfaa506a196439f6a6fd6ebd~2

Obviously let me know how they fare and attach the output of dmesg for both

Thanks
Emil</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1375313680.43D5102.23101--

--===============0265057203==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0265057203==--
