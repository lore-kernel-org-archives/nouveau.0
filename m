From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 78530] Memory corruption on Lenovo t440p with runpm
Date: Sat, 10 May 2014 19:08:09 +0000
Message-ID: <bug-78530-8800-dFzMlQBsk8@http.bugs.freedesktop.org/>
References: <bug-78530-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1172924366=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-78530-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1172924366==
Content-Type: multipart/alternative; boundary="1399748888.7A6631.23967"; charset="us-ascii"


--1399748888.7A6631.23967
Date: Sat, 10 May 2014 19:08:08 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=78530

--- Comment #8 from Nikolay Amiantov <nikoamia-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
I've tested two configurations on kernel 3.14.3, bbswitch 0.8 and nvidia
337.12:
(1) disabled acpi_call and my custom script, disabled bbswitch and bumblebeed
(all bumblebee components), modprobe'd nouveau, tried to start X
(2) started bumblebeed, loaded bbswitch, started X without nouveau, ran
"primusrun glxgears"
With both cases, I've got fs corruption issues, iwlwifi errors and other
distinctive errors pointing at memory corruption.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1399748888.7A6631.23967
Date: Sat, 10 May 2014 19:08:08 +0000
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
   title="NEW --- - Memory corruption on Lenovo t440p with runpm"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=78530#c8">Comment # 8</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - Memory corruption on Lenovo t440p with runpm"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=78530">bug 78530</a>
              from <span class="vcard"><a class="email" href="mailto:nikoamia&#64;gmail.com" title="Nikolay Amiantov &lt;nikoamia&#64;gmail.com&gt;"> <span class="fn">Nikolay Amiantov</span></a>
</span></b>
        <pre>I've tested two configurations on kernel 3.14.3, bbswitch 0.8 and nvidia
337.12:
(1) disabled acpi_call and my custom script, disabled bbswitch and bumblebeed
(all bumblebee components), modprobe'd nouveau, tried to start X
(2) started bumblebeed, loaded bbswitch, started X without nouveau, ran
&quot;primusrun glxgears&quot;
With both cases, I've got fs corruption issues, iwlwifi errors and other
distinctive errors pointing at memory corruption.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1399748888.7A6631.23967--

--===============1172924366==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1172924366==--
