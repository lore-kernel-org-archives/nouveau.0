From: Sedat Dilek <sedat.dilek@gmail.com>
Subject: Re: [PATCH] x86: mmiotrace: Use cpumask_available for cpumask_var_t variables
Date: Wed, 15 Apr 2020 15:58:56 +0200
Message-ID: <CA+icZUV336Y5YJ3OUYzXGfMZGbPSCt9YBVBRhiOnRCNQzc2z-A@mail.gmail.com>
References: <20200408205323.44490-1-natechancellor@gmail.com>
 <CA+icZUUTEEZww3qT0jfFP0ZgUPXoF1_uOHMT4ZecrQxumE1Zmg@mail.gmail.com> <CA+icZUWq=_qjvAf40PqQAj3tQ0WAZ2QAR9hojTuYqZH_=RWd_w@mail.gmail.com>
Reply-To: sedat.dilek@gmail.com
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CA+icZUWq=_qjvAf40PqQAj3tQ0WAZ2QAR9hojTuYqZH_=RWd_w@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Nathan Chancellor <natechancellor@gmail.com>
Cc: Steven Rostedt <rostedt@goodmis.org>, Ingo Molnar <mingo@kernel.org>, Karol Herbst <karolherbst@gmail.com>, Pekka Paalanen <ppaalanen@gmail.com>, x86@kernel.org, linux-kernel@vger.kernel.org, nouveau@lists.freedesktop.org, Clang-Built-Linux ML <clang-built-linux@googlegroups.com>
List-Id: nouveau.vger.kernel.org

On Wed, Apr 8, 2020 at 11:36 PM Sedat Dilek <sedat.dilek@gmail.com> wrote:

[ ... ]

> Feel free to add appropriate credits:
>
>    Tested-by: Sedat Dilek <sedat.dilek@gmail.com>
>

Re-tested with Linux v5.7-rc1 which shows this warning - with GCC v9.3
and LLVM/Clang v10.0.0 (and snapshot/pre-release of v10.0.1) on
Debian/testing AMD64.

- Sedat -
