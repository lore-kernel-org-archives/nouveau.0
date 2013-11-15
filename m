From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 71382] [NV4C] Nouveau dmesg error, computer hangs
Date: Fri, 15 Nov 2013 18:51:41 +0000
Message-ID: <bug-71382-8800-5gf5Kl2out@http.bugs.freedesktop.org/>
References: <bug-71382-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1147494718=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-71382-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1147494718==
Content-Type: multipart/alternative; boundary="1384541501.4Cda4f1.18479"; charset="us-ascii"


--1384541501.4Cda4f1.18479
Date: Fri, 15 Nov 2013 18:51:41 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=71382

--- Comment #7 from Martin <martin.kaffanke-RbZlAiThDcE@public.gmane.org> ---
I found a way to reproduce it, when I was searching for unity debugging.

Doing

/usr/lib/nux/unity_support_test -p 

in my terminal immediately hangs my system.  But now I don't know how to get
debug information out of this.  Maybe you can help me with that step?

Thanks,
Martin

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1384541501.4Cda4f1.18479
Date: Fri, 15 Nov 2013 18:51:41 +0000
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
   title="NEW --- - [NV4C] Nouveau dmesg error, computer hangs"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=71382#c7">Comment # 7</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV4C] Nouveau dmesg error, computer hangs"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=71382">bug 71382</a>
              from <span class="vcard"><a class="email" href="mailto:martin.kaffanke&#64;gmx.at" title="Martin &lt;martin.kaffanke&#64;gmx.at&gt;"> <span class="fn">Martin</span></a>
</span></b>
        <pre>I found a way to reproduce it, when I was searching for unity debugging.

Doing

/usr/lib/nux/unity_support_test -p 

in my terminal immediately hangs my system.  But now I don't know how to get
debug information out of this.  Maybe you can help me with that step?

Thanks,
Martin</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1384541501.4Cda4f1.18479--

--===============1147494718==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1147494718==--
