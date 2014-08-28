From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 83079] [NVC0] Dota 2 (Linux native and Wine) crash
 with Nouveau Drivers
Date: Thu, 28 Aug 2014 17:59:05 +0000
Message-ID: <bug-83079-8800-MNKR53jovv@http.bugs.freedesktop.org/>
References: <bug-83079-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1210764555=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-83079-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============1210764555==
Content-Type: multipart/alternative; boundary="1409248744.bE34E08a1.8447"; charset="us-ascii"


--1409248744.bE34E08a1.8447
Date: Thu, 28 Aug 2014 17:59:04 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=83079

--- Comment #11 from Tobias Klausmann <tobias.klausmann-AqjdNwhu20eELgA04lAiVw@public.gmane.org> ---
Debug result:

Program received signal SIGSEGV, Segmentation fault.                            
[Switching to Thread 0xde9afb40 (LWP 2840)]                                     
0xf4b639d6 in nv50_ir::Graph::Node::reachableBy(nv50_ir::Graph::Node const*,
nv50_ir::Graph::Node const*) const () from /usr/lib/dri/nouveau_dri.so



Lets see if i can get the crashing shader out next...

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1409248744.bE34E08a1.8447
Date: Thu, 28 Aug 2014 17:59:04 +0000
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
   title="NEW --- - [NVC0] Dota 2 (Linux native and Wine) crash with Nouveau Drivers"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=83079#c11">Comment # 11</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVC0] Dota 2 (Linux native and Wine) crash with Nouveau Drivers"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=83079">bug 83079</a>
              from <span class="vcard"><a class="email" href="mailto:tobias.klausmann&#64;mni.thm.de" title="Tobias Klausmann &lt;tobias.klausmann&#64;mni.thm.de&gt;"> <span class="fn">Tobias Klausmann</span></a>
</span></b>
        <pre>Debug result:

Program received signal SIGSEGV, Segmentation fault.                            
[Switching to Thread 0xde9afb40 (LWP 2840)]                                     
0xf4b639d6 in nv50_ir::Graph::Node::reachableBy(nv50_ir::Graph::Node const*,
nv50_ir::Graph::Node const*) const () from /usr/lib/dri/nouveau_dri.so



Lets see if i can get the crashing shader out next...</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1409248744.bE34E08a1.8447--

--===============1210764555==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1210764555==--
