From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 58556] MacBook Pro 5, 1 with nVidia 9400m and 9600m,
 scrambled screen
Date: Tue, 23 Jul 2013 21:56:27 +0000
Message-ID: <bug-58556-8800-fXewFDMPQP@http.bugs.freedesktop.org/>
References: <bug-58556-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0027448470=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-58556-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0027448470==
Content-Type: multipart/alternative; boundary="1374616587.c1Ce43.29827"; charset="us-ascii"


--1374616587.c1Ce43.29827
Date: Tue, 23 Jul 2013 21:56:27 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=58556

--- Comment #3 from Matyas <Markovics.matyas-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
I am also experiencing this issue.

I am booting the kernel EFI stub using refind on my macbook 5,1.
This model is fitted only with nvidia 9400M.

I use nouveau.noaccel=1 as a boot parameter.
This way I at least get a scrambled screen after the efifb handover.
Otherwise the screen would just freeze.

When I can see that the init script finished, I blindly log in and type
pm-suspend.
Than I press the power button to wake from suspend.
Now, I am presented with a usable screen, but not accelerated.
I can also run X.

I am running Gentoo. Tried vanilla and git kernels in and out of tree without
luck, from version 3.7.4 till 3.10.1

Clearly it is a handover problem. If there is any useful information I can
provide let me know how.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1374616587.c1Ce43.29827
Date: Tue, 23 Jul 2013 21:56:27 +0000
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
   title="NEW --- - MacBook Pro 5,1 with nVidia 9400m and 9600m, scrambled screen"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=58556#c3">Comment # 3</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - MacBook Pro 5,1 with nVidia 9400m and 9600m, scrambled screen"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=58556">bug 58556</a>
              from <span class="vcard"><a class="email" href="mailto:Markovics.matyas&#64;gmail.com" title="Matyas &lt;Markovics.matyas&#64;gmail.com&gt;"> <span class="fn">Matyas</span></a>
</span></b>
        <pre>I am also experiencing this issue.

I am booting the kernel EFI stub using refind on my macbook 5,1.
This model is fitted only with nvidia 9400M.

I use nouveau.noaccel=1 as a boot parameter.
This way I at least get a scrambled screen after the efifb handover.
Otherwise the screen would just freeze.

When I can see that the init script finished, I blindly log in and type
pm-suspend.
Than I press the power button to wake from suspend.
Now, I am presented with a usable screen, but not accelerated.
I can also run X.

I am running Gentoo. Tried vanilla and git kernels in and out of tree without
luck, from version 3.7.4 till 3.10.1

Clearly it is a handover problem. If there is any useful information I can
provide let me know how.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1374616587.c1Ce43.29827--

--===============0027448470==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0027448470==--
