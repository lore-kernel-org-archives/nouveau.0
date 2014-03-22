From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 76475] [NVE7] fails to load due to unknown opcode
 0x80 (incorrect vbios)
Date: Sat, 22 Mar 2014 21:40:55 +0000
Message-ID: <bug-76475-8800-7Av2l7wCku@http.bugs.freedesktop.org/>
References: <bug-76475-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0597627378=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-76475-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0597627378==
Content-Type: multipart/alternative; boundary="1395524454.0EabfeB1.11256"; charset="us-ascii"


--1395524454.0EabfeB1.11256
Date: Sat, 22 Mar 2014 21:40:54 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=76475

--- Comment #7 from patrick.clara-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org ---
> Unfortunately the VBIOS from the PCIROM is often the wrong one. The data
> here is the x86 opcodes instead of the vbios opocdes. And as you observed,
> we now consider unknown opcodes an error. (The init tables need to be run on
> e.g. resume, and if it's a secondary card, on load as well.)

I have read many times on the internet about PCIROM providing wrong bios. I
have tried various methods of getting one but all failed or provided the
exactly same bios as PCIROM. Vbtracetool freezes. Also nvclock fails.

> An mmiotrace of the blob loading would potentially be helpful, you can send
> one (compressed... xz -9 works well) to mmio.dumps-Re5JQEeQqe9fmgfxC/sS/w@public.gmane.org

I have sent one. I used blob version 331.49. During the trace I have loaded the
nvidia module and started X. I did it with a ubuntu live cd with kernel 3.13
since on my debian installation I m not able to launch X anymore. Hopefully I
did it right.

> Can you provide a bit more info about this system? Is it an optimus setup?
> Could you provide an acpidump?

The macine is an ASUS ZENBOOK UX51VZH, the version with the 2880x1620 display.
It appears to have only the nvidia gpu, or at least the intel one in the
i7-3632QM is permanently disabled.

I have attached lspci dmidecode and an acpidump.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1395524454.0EabfeB1.11256
Date: Sat, 22 Mar 2014 21:40:54 +0000
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
   title="NEW --- - [NVE7] fails to load due to unknown opcode 0x80 (incorrect vbios)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=76475#c7">Comment # 7</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVE7] fails to load due to unknown opcode 0x80 (incorrect vbios)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=76475">bug 76475</a>
              from <span class="vcard"><a class="email" href="mailto:patrick.clara&#64;gmail.com" title="patrick.clara&#64;gmail.com">patrick.clara&#64;gmail.com</a>
</span></b>
        <pre><span class="quote">&gt; Unfortunately the VBIOS from the PCIROM is often the wrong one. The data
&gt; here is the x86 opcodes instead of the vbios opocdes. And as you observed,
&gt; we now consider unknown opcodes an error. (The init tables need to be run on
&gt; e.g. resume, and if it's a secondary card, on load as well.)</span >

I have read many times on the internet about PCIROM providing wrong bios. I
have tried various methods of getting one but all failed or provided the
exactly same bios as PCIROM. Vbtracetool freezes. Also nvclock fails.

<span class="quote">&gt; An mmiotrace of the blob loading would potentially be helpful, you can send
&gt; one (compressed... xz -9 works well) to <a href="mailto:mmio.dumps&#64;gmail.com">mmio.dumps&#64;gmail.com</a>.</span >

I have sent one. I used blob version 331.49. During the trace I have loaded the
nvidia module and started X. I did it with a ubuntu live cd with kernel 3.13
since on my debian installation I m not able to launch X anymore. Hopefully I
did it right.

<span class="quote">&gt; Can you provide a bit more info about this system? Is it an optimus setup?
&gt; Could you provide an acpidump?</span >

The macine is an ASUS ZENBOOK UX51VZH, the version with the 2880x1620 display.
It appears to have only the nvidia gpu, or at least the intel one in the
i7-3632QM is permanently disabled.

I have attached lspci dmidecode and an acpidump.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1395524454.0EabfeB1.11256--

--===============0597627378==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0597627378==--
