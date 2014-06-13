From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 74992] [NVAA] gnome-shell freezes with vram_list
 validate fail, texture traps
Date: Fri, 13 Jun 2014 10:27:16 +0000
Message-ID: <bug-74992-8800-mrHs5Zoqn1@http.bugs.freedesktop.org/>
References: <bug-74992-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0128088181=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-74992-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0128088181==
Content-Type: multipart/alternative; boundary="1402655236.764A7AB3.2279"; charset="us-ascii"


--1402655236.764A7AB3.2279
Date: Fri, 13 Jun 2014 10:27:16 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=74992

--- Comment #9 from Fabien Bourigault <bourigaultfabien-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
I also had this bug on Arch Linux with my onboard GeForce 7300. I increased the
shared memory in the BIOS settings from 256M to 512M and problems are gone !

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1402655236.764A7AB3.2279
Date: Fri, 13 Jun 2014 10:27:16 +0000
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
   title="NEW --- - [NVAA] gnome-shell freezes with vram_list validate fail, texture traps"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=74992#c9">Comment # 9</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVAA] gnome-shell freezes with vram_list validate fail, texture traps"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=74992">bug 74992</a>
              from <span class="vcard"><a class="email" href="mailto:bourigaultfabien&#64;gmail.com" title="Fabien Bourigault &lt;bourigaultfabien&#64;gmail.com&gt;"> <span class="fn">Fabien Bourigault</span></a>
</span></b>
        <pre>I also had this bug on Arch Linux with my onboard GeForce 7300. I increased the
shared memory in the BIOS settings from 256M to 512M and problems are gone !</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1402655236.764A7AB3.2279--

--===============0128088181==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0128088181==--
