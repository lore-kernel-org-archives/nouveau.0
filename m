From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 60704] [nouveau,
 git regression] - I2C PWM fan control broken on nv50 adt7475 on
 kernels 3.3.x+
Date: Wed, 13 Feb 2013 13:23:48 +0000
Message-ID: <bug-60704-8800-Ri0bdoe3Pl@http.bugs.freedesktop.org/>
References: <bug-60704-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0663744132=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-60704-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0663744132==
Content-Type: multipart/alternative; boundary="1360761828.FEf61.3419"; charset="us-ascii"


--1360761828.FEf61.3419
Date: Wed, 13 Feb 2013 13:23:48 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=60704

--- Comment #8 from Marc Meledandri <m.meledandri-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Thanks Emil! I confirm that your patch resolves the issue for my hardware.

I can now control my GPU fan with the PWM bits. This also solves the
suspend/resume case with automatic fan control enabled.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1360761828.FEf61.3419
Date: Wed, 13 Feb 2013 13:23:48 +0000
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
   title="NEW --- - [nouveau, git regression] - I2C PWM fan control broken on nv50 adt7475 on kernels 3.3.x+"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=60704#c8">Comment # 8</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [nouveau, git regression] - I2C PWM fan control broken on nv50 adt7475 on kernels 3.3.x+"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=60704">bug 60704</a>
              from <span class="vcard"><a class="email" href="mailto:m.meledandri&#64;gmail.com" title="Marc Meledandri &lt;m.meledandri&#64;gmail.com&gt;"> <span class="fn">Marc Meledandri</span></a>
</span></b>
        <pre>Thanks Emil! I confirm that your patch resolves the issue for my hardware.

I can now control my GPU fan with the PWM bits. This also solves the
suspend/resume case with automatic fan control enabled.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1360761828.FEf61.3419--

--===============0663744132==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0663744132==--
