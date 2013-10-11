From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 70390] [NV84] Repeated system crashes under graphics
 load, E[PFIFO] DMA_PUSHER and lots of E[PGRAPH]
Date: Fri, 11 Oct 2013 21:30:44 +0000
Message-ID: <bug-70390-8800-TcyFrh8pTF@http.bugs.freedesktop.org/>
References: <bug-70390-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1349421115=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-70390-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1349421115==
Content-Type: multipart/alternative; boundary="1381527044.cEdAFfAe2.13362"; charset="us-ascii"


--1381527044.cEdAFfAe2.13362
Date: Fri, 11 Oct 2013 21:30:44 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=70390

--- Comment #6 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
The commonality here is that in all cases you get

[22145.017855] nouveau E[   PFIFO][0000:01:00.0] DMA_PUSHER - ch 4
[stellarium[17059]] get 0x0020049408 put 0x0020053fcc ib_get 0x00000349 ib_put
0x00000352 state 0x80007641 (err: INVALID_CMD) push 0x00406040

But 0x00406040 is a perfectly valid command, ever since the Riva TNT chips. It
should decode as

method = 0x10
subchan = 3
count = 0x10

This makes sense. These 4 methods deal with semaphore manipulation.

<reg32 offset="0x10" name="SEMAPHORE_ADDRESS_HIGH" variants="NV84-"/>
<reg32 offset="0x14" name="SEMAPHORE_ADDRESS_LOW" variants="NV84-"/>
<reg32 offset="0x18" name="SEMAPHORE_SEQUENCE" variants="NV84-"/>
<reg32 offset="0x1c" name="SEMAPHORE_TRIGGER" variants="NV84-">

which happens a fair bit for CPU vs GPU syncs.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1381527044.cEdAFfAe2.13362
Date: Fri, 11 Oct 2013 21:30:44 +0000
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
   title="NEW --- - [NV84] Repeated system crashes under graphics load, E[PFIFO] DMA_PUSHER and lots of E[PGRAPH]"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=70390#c6">Comment # 6</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV84] Repeated system crashes under graphics load, E[PFIFO] DMA_PUSHER and lots of E[PGRAPH]"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=70390">bug 70390</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>The commonality here is that in all cases you get

[22145.017855] nouveau E[   PFIFO][0000:01:00.0] DMA_PUSHER - ch 4
[stellarium[17059]] get 0x0020049408 put 0x0020053fcc ib_get 0x00000349 ib_put
0x00000352 state 0x80007641 (err: INVALID_CMD) push 0x00406040

But 0x00406040 is a perfectly valid command, ever since the Riva TNT chips. It
should decode as

method = 0x10
subchan = 3
count = 0x10

This makes sense. These 4 methods deal with semaphore manipulation.

&lt;reg32 offset=&quot;0x10&quot; name=&quot;SEMAPHORE_ADDRESS_HIGH&quot; variants=&quot;NV84-&quot;/&gt;
&lt;reg32 offset=&quot;0x14&quot; name=&quot;SEMAPHORE_ADDRESS_LOW&quot; variants=&quot;NV84-&quot;/&gt;
&lt;reg32 offset=&quot;0x18&quot; name=&quot;SEMAPHORE_SEQUENCE&quot; variants=&quot;NV84-&quot;/&gt;
&lt;reg32 offset=&quot;0x1c&quot; name=&quot;SEMAPHORE_TRIGGER&quot; variants=&quot;NV84-&quot;&gt;

which happens a fair bit for CPU vs GPU syncs.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1381527044.cEdAFfAe2.13362--

--===============1349421115==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1349421115==--
