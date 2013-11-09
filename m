From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 71382] Nouveau dmesg error, computer hangs
Date: Sat, 09 Nov 2013 11:18:55 +0000
Message-ID: <bug-71382-8800-W7pcBZ1sEp@http.bugs.freedesktop.org/>
References: <bug-71382-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0524134867=="
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


--===============0524134867==
Content-Type: multipart/alternative; boundary="1383995935.Cdb351.26703"; charset="us-ascii"


--1383995935.Cdb351.26703
Date: Sat, 9 Nov 2013 11:18:55 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=71382

--- Comment #2 from Martin <martin.kaffanke-RbZlAiThDcE@public.gmane.org> ---
Thanks so much, this seems to be the solution.

I took the original ubuntu saucy (13.10) package, created the patch to linked
for me by hand, compiled it and installed it, so it differs realy just with
that patch from the original ubuntu package.

I put it on launchpad 
https://launchpad.net/~martin-kaffanke/+archive/personalbugfixes

So ubuntu saucy (13.10) users can use it by doing

# sudo add-apt-repository ppa:martin-kaffanke/personalbugfixes
# sudo apt-get update && sudo apt-get upgrade

in the terminal.

Thanks.

PS. If the bug comes again because I tested it just a few hours till now,
I'll come back. :)

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1383995935.Cdb351.26703
Date: Sat, 9 Nov 2013 11:18:55 +0000
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
   title="NEW --- - Nouveau dmesg error, computer hangs"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=71382#c2">Comment # 2</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - Nouveau dmesg error, computer hangs"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=71382">bug 71382</a>
              from <span class="vcard"><a class="email" href="mailto:martin.kaffanke&#64;gmx.at" title="Martin &lt;martin.kaffanke&#64;gmx.at&gt;"> <span class="fn">Martin</span></a>
</span></b>
        <pre>Thanks so much, this seems to be the solution.

I took the original ubuntu saucy (13.10) package, created the patch to linked
for me by hand, compiled it and installed it, so it differs realy just with
that patch from the original ubuntu package.

I put it on launchpad 
<a href="https://launchpad.net/~martin-kaffanke/+archive/personalbugfixes">https://launchpad.net/~martin-kaffanke/+archive/personalbugfixes</a>

So ubuntu saucy (13.10) users can use it by doing

# sudo add-apt-repository ppa:martin-kaffanke/personalbugfixes
# sudo apt-get update &amp;&amp; sudo apt-get upgrade

in the terminal.

Thanks.

PS. If the bug comes again because I tested it just a few hours till now,
I'll come back. :)</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1383995935.Cdb351.26703--

--===============0524134867==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0524134867==--
