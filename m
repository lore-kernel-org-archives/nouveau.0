From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 68456] [NV4B] null deref on load,
	NvI2C=1 makes it work
Date: Fri, 23 Aug 2013 16:54:15 +0000
Message-ID: <bug-68456-8800-DOiXDXqoww@http.bugs.freedesktop.org/>
References: <bug-68456-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0237036257=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-68456-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0237036257==
Content-Type: multipart/alternative; boundary="1377276855.A0aF7c1.15664"; charset="us-ascii"


--1377276855.A0aF7c1.15664
Date: Fri, 23 Aug 2013 16:54:15 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=68456

--- Comment #3 from Hans-Peter Deifel <hpdeifel-Mmb7MZpHnFY@public.gmane.org> ---
Your patch did work, thank you very much. I could load the module and use it
for a few hours without problems.

I had indeed set bit_test=1 for i2c_algo_bit although I had forgotten about it.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1377276855.A0aF7c1.15664
Date: Fri, 23 Aug 2013 16:54:15 +0000
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
   title="NEW --- - [NV4B] null deref on load, NvI2C=1 makes it work"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=68456#c3">Comment # 3</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV4B] null deref on load, NvI2C=1 makes it work"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=68456">bug 68456</a>
              from <span class="vcard"><a class="email" href="mailto:hpdeifel&#64;gmx.de" title="Hans-Peter Deifel &lt;hpdeifel&#64;gmx.de&gt;"> <span class="fn">Hans-Peter Deifel</span></a>
</span></b>
        <pre>Your patch did work, thank you very much. I could load the module and use it
for a few hours without problems.

I had indeed set bit_test=1 for i2c_algo_bit although I had forgotten about it.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1377276855.A0aF7c1.15664--

--===============0237036257==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0237036257==--
