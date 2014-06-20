From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 80266] Undefined operation in tgsi_ureg.c left shift
 of 1 by 31 places cannot be represented in type 'int'
Date: Fri, 20 Jun 2014 05:48:55 +0000
Message-ID: <bug-80266-8800-ExnQwqgufC@http.bugs.freedesktop.org/>
References: <bug-80266-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0036901087=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-80266-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0036901087==
Content-Type: multipart/alternative; boundary="1403243335.A356f0c0.19656"; charset="us-ascii"


--1403243335.A356f0c0.19656
Date: Fri, 20 Jun 2014 05:48:55 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=80266

--- Comment #1 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
(In reply to comment #0)
> In tgsi_ureg.c:1498
> "if (ureg->vs_inputs[i/32] & (1 << (i%32))) {"
> when i==31 then 1 << 31 may be computed.
> With gcc option -std=c99 this is wrong because the result cannot be int.
> 
> Perhaps the right instruction is
> "if (ureg->vs_inputs[i/32] & ((unsigned) 1 << (i%32))) {"

Where is -std=c99 coming from? Also I'd guess the better thing is 1U instead of
(unsigned)1 :)

Feel free to send a patch btw.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1403243335.A356f0c0.19656
Date: Fri, 20 Jun 2014 05:48:55 +0000
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
   title="NEW --- - Undefined operation in tgsi_ureg.c left shift of 1 by 31 places cannot be represented in type 'int'"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=80266#c1">Comment # 1</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - Undefined operation in tgsi_ureg.c left shift of 1 by 31 places cannot be represented in type 'int'"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=80266">bug 80266</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=80266#c0">comment #0</a>)
<span class="quote">&gt; In tgsi_ureg.c:1498
&gt; &quot;if (ureg-&gt;vs_inputs[i/32] &amp; (1 &lt;&lt; (i%32))) {&quot;
&gt; when i==31 then 1 &lt;&lt; 31 may be computed.
&gt; With gcc option -std=c99 this is wrong because the result cannot be int.
&gt; 
&gt; Perhaps the right instruction is
&gt; &quot;if (ureg-&gt;vs_inputs[i/32] &amp; ((unsigned) 1 &lt;&lt; (i%32))) {&quot;</span >

Where is -std=c99 coming from? Also I'd guess the better thing is 1U instead of
(unsigned)1 :)

Feel free to send a patch btw.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1403243335.A356f0c0.19656--

--===============0036901087==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0036901087==--
