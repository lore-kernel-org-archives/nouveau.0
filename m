From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 68665] Crashing games when set AA to x2 on GTX760
Date: Wed, 28 Aug 2013 14:41:22 +0000
Message-ID: <bug-68665-8800-rR1r4B7RTE@http.bugs.freedesktop.org/>
References: <bug-68665-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0328597841=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-68665-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0328597841==
Content-Type: multipart/alternative; boundary="1377700882.B3C70.3366"; charset="us-ascii"


--1377700882.B3C70.3366
Date: Wed, 28 Aug 2013 14:41:22 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=68665

--- Comment #2 from Igor Gnatenko <i.gnatenko.brain-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
(In reply to comment #1)
> Do you see anything in dmesg when this happens?
Aug 27 14:26:43 Elias kernel: [15584.798799] nouveau E[  PGRAPH][0000:01:00.0]
DATA_ERROR [INVALID_VALUE] ch 5 [0x000007f73d supertuxkart[6691]] subc 1 class
0xa0c0 mthd 0x02e8 data 0x0040aaaa
Aug 27 14:26:43 Elias kernel: [15584.798816] nouveau E[  PGRAPH][0000:01:00.0]
DATA_ERROR [INVALID_VALUE] ch 5 [0x000007f73d supertuxkart[6691]] subc 1 class
0xa0c0 mthd 0x02f4 data 0x0040aaaa
Aug 27 14:27:22 Elias kernel: [15623.033892] nouveau E[  PGRAPH][0000:01:00.0]
DATA_ERROR [INVALID_VALUE] ch 5 [0x000007f73d supertuxkart[6709]] subc 1 class
0xa0c0 mthd 0x02e8 data 0x0040aaaa
Aug 27 14:27:22 Elias kernel: [15623.033912] nouveau E[  PGRAPH][0000:01:00.0]
DATA_ERROR [INVALID_VALUE] ch 5 [0x000007f73d supertuxkart[6709]] subc 1 class
0xa0c0 mthd 0x02f4 data 0x0040aaaa
Aug 27 15:51:56 Elias kernel: [20697.098486] nouveau E[  PGRAPH][0000:01:00.0]
DATA_ERROR [INVALID_VALUE] ch 5 [0x000007f73d supertuxkart[6867]] subc 1 class
0xa0c0 mthd 0x02e8 data 0x0040aaaa
Aug 27 15:51:56 Elias kernel: [20697.098503] nouveau E[  PGRAPH][0000:01:00.0]
DATA_ERROR [INVALID_VALUE] ch 5 [0x000007f73d supertuxkart[6867]] subc 1 class
0xa0c0 mthd 0x02f4 data 0x0040aaaa
Aug 27 15:51:56 Elias kernel: [20697.328287] traps: supertuxkart[6867] general
protection ip:7fed62c742af sp:7fff81412af0 error:0 in
libdrm_nouveau.so.2.0.0[7fed62c71000+6000]
Aug 27 15:51:57 Elias abrt[6878]: Saved core dump of pid 6867
(/usr/bin/supertuxkart) to /var/tmp/abrt/ccpp-2013-08-27-15:51:56-6867
(36970496 bytes)

In other bugreports I see the similar.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1377700882.B3C70.3366
Date: Wed, 28 Aug 2013 14:41:22 +0000
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
   title="NEW --- - Crashing games when set AA to x2 on GTX760"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=68665#c2">Comment # 2</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - Crashing games when set AA to x2 on GTX760"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=68665">bug 68665</a>
              from <span class="vcard"><a class="email" href="mailto:i.gnatenko.brain&#64;gmail.com" title="Igor Gnatenko &lt;i.gnatenko.brain&#64;gmail.com&gt;"> <span class="fn">Igor Gnatenko</span></a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=68665#c1">comment #1</a>)
<span class="quote">&gt; Do you see anything in dmesg when this happens?</span >
Aug 27 14:26:43 Elias kernel: [15584.798799] nouveau E[  PGRAPH][0000:01:00.0]
DATA_ERROR [INVALID_VALUE] ch 5 [0x000007f73d supertuxkart[6691]] subc 1 class
0xa0c0 mthd 0x02e8 data 0x0040aaaa
Aug 27 14:26:43 Elias kernel: [15584.798816] nouveau E[  PGRAPH][0000:01:00.0]
DATA_ERROR [INVALID_VALUE] ch 5 [0x000007f73d supertuxkart[6691]] subc 1 class
0xa0c0 mthd 0x02f4 data 0x0040aaaa
Aug 27 14:27:22 Elias kernel: [15623.033892] nouveau E[  PGRAPH][0000:01:00.0]
DATA_ERROR [INVALID_VALUE] ch 5 [0x000007f73d supertuxkart[6709]] subc 1 class
0xa0c0 mthd 0x02e8 data 0x0040aaaa
Aug 27 14:27:22 Elias kernel: [15623.033912] nouveau E[  PGRAPH][0000:01:00.0]
DATA_ERROR [INVALID_VALUE] ch 5 [0x000007f73d supertuxkart[6709]] subc 1 class
0xa0c0 mthd 0x02f4 data 0x0040aaaa
Aug 27 15:51:56 Elias kernel: [20697.098486] nouveau E[  PGRAPH][0000:01:00.0]
DATA_ERROR [INVALID_VALUE] ch 5 [0x000007f73d supertuxkart[6867]] subc 1 class
0xa0c0 mthd 0x02e8 data 0x0040aaaa
Aug 27 15:51:56 Elias kernel: [20697.098503] nouveau E[  PGRAPH][0000:01:00.0]
DATA_ERROR [INVALID_VALUE] ch 5 [0x000007f73d supertuxkart[6867]] subc 1 class
0xa0c0 mthd 0x02f4 data 0x0040aaaa
Aug 27 15:51:56 Elias kernel: [20697.328287] traps: supertuxkart[6867] general
protection ip:7fed62c742af sp:7fff81412af0 error:0 in
libdrm_nouveau.so.2.0.0[7fed62c71000+6000]
Aug 27 15:51:57 Elias abrt[6878]: Saved core dump of pid 6867
(/usr/bin/supertuxkart) to /var/tmp/abrt/ccpp-2013-08-27-15:51:56-6867
(36970496 bytes)

In other bugreports I see the similar.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1377700882.B3C70.3366--

--===============0328597841==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0328597841==--
