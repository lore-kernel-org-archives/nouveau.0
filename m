From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 74613] [NV34] [v3.14-rc1] nouveau: get 0x10000000
 put 0x0000ed30 state 0xc0000000 (err: MEM_FAULT) push 0x00000000
Date: Sat, 15 Feb 2014 19:35:58 +0000
Message-ID: <bug-74613-8800-mTrT72QRWW@http.bugs.freedesktop.org/>
References: <bug-74613-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0218087624=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-74613-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0218087624==
Content-Type: multipart/alternative; boundary="1392492958.54F7dEc72.14461"; charset="us-ascii"


--1392492958.54F7dEc72.14461
Date: Sat, 15 Feb 2014 19:35:58 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=74613

--- Comment #7 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
That code _really_ shouldn't affect anything pre-nv50...

The only thing is in second hunk. node->memtype is only ever set to != 0 for
nv50+, but... who knows.

Can you add a WARN_ON_ONCE(node->memtype) in there?

The third hunk only affects code for card_type >= NV_50... unless I'm reading
something very wrong.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1392492958.54F7dEc72.14461
Date: Sat, 15 Feb 2014 19:35:58 +0000
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
   title="NEW --- - [NV34] [v3.14-rc1] nouveau: get 0x10000000 put 0x0000ed30 state 0xc0000000 (err: MEM_FAULT) push 0x00000000"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=74613#c7">Comment # 7</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV34] [v3.14-rc1] nouveau: get 0x10000000 put 0x0000ed30 state 0xc0000000 (err: MEM_FAULT) push 0x00000000"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=74613">bug 74613</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>That code _really_ shouldn't affect anything pre-nv50...

The only thing is in second hunk. node-&gt;memtype is only ever set to != 0 for
nv50+, but... who knows.

Can you add a WARN_ON_ONCE(node-&gt;memtype) in there?

The third hunk only affects code for card_type &gt;= NV_50... unless I'm reading
something very wrong.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1392492958.54F7dEc72.14461--

--===============0218087624==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0218087624==--
