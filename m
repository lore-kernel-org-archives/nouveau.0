From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 59168] [nvc1/Quardro1000M|nvc3/Quadro2000M] graphic
 garbage/corruption/noise on resume
Date: Fri, 22 Feb 2013 12:05:36 +0000
Message-ID: <bug-59168-8800-uVuTeR4Mgg@http.bugs.freedesktop.org/>
References: <bug-59168-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2141760266=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-59168-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============2141760266==
Content-Type: multipart/alternative; boundary="1361534737.2f6E05.16821"; charset="us-ascii"


--1361534737.2f6E05.16821
Date: Fri, 22 Feb 2013 12:05:37 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=59168

--- Comment #25 from Petr Stastny <p.stastny-Mmb7MZpHnFY@public.gmane.org> ---
I was digging in the nouveau code a bit and looking where the endlessly
repeating messages 

[   66.090322] nouveau E[  PGRAPH][0000:01:00.0] TRAP ch 1 [0x007fce1000]
[   66.090358] nouveau E[  PGRAPH][0000:01:00.0] SHADER 0xa004021e
[   66.090457] nouveau E[  PGRAPH][0000:01:00.0] TRAP ch 1 [0x007fce1000]
[   66.090485] nouveau E[  PGRAPH][0000:01:00.0] SHADER 0xa004021e

It looks to me like something should be initialized but does not.

I got to the source code file nouveau/core/engine/graph/nvc0.c

        switch (nvc0_graph_class(priv)) {
        case 0x9097:
                nv_engine(priv)->sclass = nvc0_graph_sclass;
                break;
        case 0x9197:
                nv_engine(priv)->sclass = nvc1_graph_sclass;
                break;
        case 0x9297:
                nv_engine(priv)->sclass = nvc8_graph_sclass;
                break;
        }
What I am just curious about - I do not see here any implementation for nvc3 -
is this maybe the problem or is nvc3 already handled by any of the 3 methods
listed here?

When I find some time, I could debug this more. Can somebody point me in the
right direction? Is there any documentation for the implementation? I would
like to fix the problem :)

BTW: the code above is from 3.8-rc7

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1361534737.2f6E05.16821
Date: Fri, 22 Feb 2013 12:05:37 +0000
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
   title="NEW --- - [nvc1/Quardro1000M|nvc3/Quadro2000M] graphic garbage/corruption/noise on resume"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=59168#c25">Comment # 25</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [nvc1/Quardro1000M|nvc3/Quadro2000M] graphic garbage/corruption/noise on resume"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=59168">bug 59168</a>
              from <span class="vcard"><a class="email" href="mailto:p.stastny&#64;gmx.de" title="Petr Stastny &lt;p.stastny&#64;gmx.de&gt;"> <span class="fn">Petr Stastny</span></a>
</span></b>
        <pre>I was digging in the nouveau code a bit and looking where the endlessly
repeating messages 

[   66.090322] nouveau E[  PGRAPH][0000:01:00.0] TRAP ch 1 [0x007fce1000]
[   66.090358] nouveau E[  PGRAPH][0000:01:00.0] SHADER 0xa004021e
[   66.090457] nouveau E[  PGRAPH][0000:01:00.0] TRAP ch 1 [0x007fce1000]
[   66.090485] nouveau E[  PGRAPH][0000:01:00.0] SHADER 0xa004021e

It looks to me like something should be initialized but does not.

I got to the source code file nouveau/core/engine/graph/nvc0.c

        switch (nvc0_graph_class(priv)) {
        case 0x9097:
                nv_engine(priv)-&gt;sclass = nvc0_graph_sclass;
                break;
        case 0x9197:
                nv_engine(priv)-&gt;sclass = nvc1_graph_sclass;
                break;
        case 0x9297:
                nv_engine(priv)-&gt;sclass = nvc8_graph_sclass;
                break;
        }
What I am just curious about - I do not see here any implementation for nvc3 -
is this maybe the problem or is nvc3 already handled by any of the 3 methods
listed here?

When I find some time, I could debug this more. Can somebody point me in the
right direction? Is there any documentation for the implementation? I would
like to fix the problem :)

BTW: the code above is from 3.8-rc7</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1361534737.2f6E05.16821--

--===============2141760266==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============2141760266==--
