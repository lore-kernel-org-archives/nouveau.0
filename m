From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 62848] xorg not start after kexec when use nouveau
Date: Thu, 07 Aug 2014 14:39:21 +0000
Message-ID: <bug-62848-8800-bCs0izfKPm@http.bugs.freedesktop.org/>
References: <bug-62848-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0063725554=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-62848-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0063725554==
Content-Type: multipart/alternative; boundary="1407422361.40ee1.13191"; charset="us-ascii"


--1407422361.40ee1.13191
Date: Thu, 7 Aug 2014 14:39:21 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=62848

--- Comment #2 from Pierre BLONDEAU <pierre.blondeau-PxWOhfqfhmpGWvitb5QawA@public.gmane.org> ---
Hi,

I have the same problem with a GT218M .

The argument nouveau.config=NvForcePost=1 doesn't work, but if i specify
blacklist=nouveau in the cmdline, all is OK.

If i install the nvidia driver, it's ok too.

I use an ubuntu 14.04 with standard package.

Regards

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1407422361.40ee1.13191
Date: Thu, 7 Aug 2014 14:39:21 +0000
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
   title="NEW --- - xorg not start after kexec when use nouveau"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=62848#c2">Comment # 2</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - xorg not start after kexec when use nouveau"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=62848">bug 62848</a>
              from <span class="vcard"><a class="email" href="mailto:pierre.blondeau&#64;unicaen.fr" title="Pierre BLONDEAU &lt;pierre.blondeau&#64;unicaen.fr&gt;"> <span class="fn">Pierre BLONDEAU</span></a>
</span></b>
        <pre>Hi,

I have the same problem with a GT218M .

The argument nouveau.config=NvForcePost=1 doesn't work, but if i specify
blacklist=nouveau in the cmdline, all is OK.

If i install the nvidia driver, it's ok too.

I use an ubuntu 14.04 with standard package.

Regards</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1407422361.40ee1.13191--

--===============0063725554==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0063725554==--
