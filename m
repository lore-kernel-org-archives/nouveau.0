From: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [PATCH] x86: mmiotrace: Use cpumask_available for cpumask_var_t variables
Date: Mon, 18 May 2020 17:29:13 -0700
Message-ID: <CAHk-=wiwom6EF4DqStcZD0cJwXRMwAmLx2Z-wcn5xTiaJpgEkA@mail.gmail.com>
References: <20200408205323.44490-1-natechancellor@gmail.com>
 <20200518093117.GA719849@ubuntu-s3-xlarge-x86> <CAKwvOdmXgYThHRDpt5dFZy5T1zS6MYQhcBNcq6-rsuc5fjiE6Q@mail.gmail.com>
 <20200518183513.53b94f11@gandalf.local.home>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200518183513.53b94f11@gandalf.local.home>
Sender: linux-kernel-owner@vger.kernel.org
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Nick Desaulniers <ndesaulniers@google.com>, Nathan Chancellor <natechancellor@gmail.com>, Ingo Molnar <mingo@kernel.org>, Karol Herbst <karolherbst@gmail.com>, Pekka Paalanen <ppaalanen@gmail.com>, "maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>, LKML <linux-kernel@vger.kernel.org>, nouveau@lists.freedesktop.org, clang-built-linux <clang-built-linux@googlegroups.com>, Sedat Dilek <sedat.dilek@gmail.com>
List-Id: nouveau.vger.kernel.org

On Mon, May 18, 2020 at 3:35 PM Steven Rostedt <rostedt@goodmis.org> wrote:
>
> Linus,
>
> Are you OK with this patch?

Yup, I don't care deeply either way, as long as we can get rid of the warning.

                Linus
